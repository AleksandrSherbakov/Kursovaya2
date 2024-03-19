using MaterialsCalculator.Models;
using Microsoft.Win32;
using System;
using System.IO;
using System.Windows;
using System.Windows.Media.Imaging;

namespace MaterialsCalculator.Windows
{
	public partial class EditMaterialWindow : Window
	{
		private Material _currentMaterial;

		private string _filePath = null;
		private string _photoName = null;

		public EditMaterialWindow(Material material)
		{
			InitializeComponent();
			//LoadData();
			_currentMaterial = material;
			this.DataContext = _currentMaterial;

			// Заполнение данных о материале в поля формы
			TBName.Text = _currentMaterial.Name;
			TBDescription.Text = _currentMaterial.Description;
			ComboBoxType.SelectedIndex = (int)_currentMaterial.MaterialTypeID-1;
			ComboBoxManufacturer.SelectedIndex = (int)_currentMaterial.ManufacturerID-1;
			TBPrice.Text = _currentMaterial.Price;
			TBSquare.Text = _currentMaterial.Square;
			ImageMaterialPhoto.Source = new BitmapImage(new Uri(Directory.GetCurrentDirectory() + @"\Images\Materials\" +_currentMaterial.Image));

		}
		public void LoadData()
		{
			/*_currentMaterial = material;
			this.DataContext = _currentMaterial;

			// Заполнение данных о материале в поля формы
			TBName.Text = _currentMaterial.Name;
			TBDescription.Text = _currentMaterial.Description;
			// Другие поля...

			// Отображение изображения материала, если оно есть
			if (!string.IsNullOrEmpty(_currentMaterial.Image))
			{
				ImageMaterialPhoto.Source = new BitmapImage(new Uri(_currentMaterial.Image));
			}*/
		}
		private void BtnOk_Click(object sender, RoutedEventArgs e)
		{
			try
			{
				// Обновление данных о материале
				_currentMaterial.Name = TBName.Text;
				_currentMaterial.Description = TBDescription.Text;
				_currentMaterial.MaterialTypeID = ComboBoxType.SelectedIndex + 1;
				_currentMaterial.ManufacturerID = ComboBoxManufacturer.SelectedIndex + 1;
				_currentMaterial.Square = Convert.ToInt32(TBSquare.Text).ToString();
				_currentMaterial.Price = Convert.ToInt32(TBPrice.Text).ToString();

				

				string _currentDirectory = Directory.GetCurrentDirectory() + @"\Images\Materials\";
				string photo = ChangePhotoName(_currentDirectory);
				string dest = _currentDirectory + photo;
				File.Copy(_filePath, dest);
				_currentMaterial.Image = photo;

				// Сохранение изменений в базе данных
				MaterialsCalculatorEntities.GetContext().SaveChanges();

				MessageBox.Show("Изменения сохранены");
				DialogResult = true;
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void BtnCancel_Click(object sender, RoutedEventArgs e)
		{
			DialogResult = false;
		}

		string ChangePhotoName(string _currentDirectory)
		{
			string x = _currentDirectory + _photoName;
			string photoname = _photoName;

			int i = 0;
			if (File.Exists(x))
			{
				while (File.Exists(x))
				{
					i++;
					x = _currentDirectory + i.ToString() + photoname;
				}
				photoname = i.ToString() + photoname;
			}
			return photoname;
		}
		private void ButtonLoadPhoto_Click(object sender, RoutedEventArgs e)
		{
			try
			{
				//Диалог открытия файла
				OpenFileDialog op = new OpenFileDialog
				{
					Title = "Select a picture",
					Filter = "PNG Files (*.png)|*.png"
				};
				// диалог вернет true, если файл был открыт
				if (op.ShowDialog() == true)
				{
					ImageMaterialPhoto.Source = new BitmapImage(new Uri(op.FileName));
					_photoName = op.SafeFileName;
					_filePath = op.FileName;
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK,
				MessageBoxImage.Error);
				_filePath = null;
			}
		}
	}
}