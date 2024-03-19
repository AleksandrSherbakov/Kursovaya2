using MaterialsCalculator.Models;
using MaterialsCalculator.Pages;
using MaterialsCalculator.Windows;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System;

namespace MaterialsCalculator.Windows
{
	/// <summary>
	/// Логика взаимодействия для DeleteMaterialsWindow.xaml
	/// </summary>
	public partial class DeleteMaterialsWindow : Window
	{
		public Material _curentMaterial;
		public DeleteMaterialsWindow()
		{
			InitializeComponent();
			LoadAndInitData();
		}
		void LoadAndInitData()
		{
			// загрузка мероприятий в ListBox сортируем по Дате
			var mce = MaterialsCalculatorEntities.GetContext().Materials.ToList();
			ListBoxMaterials.ItemsSource = mce;
		}
		private void Button_Click(object sender, RoutedEventArgs e)
		{
			// Проверяем, выбран ли какой-то материал для удаления
			if (ListBoxMaterials.SelectedItem != null)
			{
				// Получаем выбранный материал
				Material material = ListBoxMaterials.SelectedItem as Material;

				// Отображаем диалоговое окно для подтверждения удаления
				MessageBoxResult result = MessageBox.Show("Вы уверены, что хотите удалить выбранный материал?", "Подтверждение удаления", MessageBoxButton.YesNo, MessageBoxImage.Question);

				// Если пользователь подтвердил удаление
				if (result == MessageBoxResult.Yes)
				{
					// Удаляем материал из базы данных
					using (var context = new MaterialsCalculatorEntities())
					{
						// При условии, что MaterialId - это уникальный идентификатор материала в вашей базе данных
						var materialToDelete = context.Materials.FirstOrDefault(m => m.MaterialID == material.MaterialID);

						if (materialToDelete != null)
						{
							context.Materials.Remove(materialToDelete);
							context.SaveChanges();

							// Обновляем отображаемый список материалов после удаления
							LoadAndInitData();

							MessageBox.Show("Материал успешно удален", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
						}
						else
						{
							MessageBox.Show("Материал не найден", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
						}
					}
				}
			}
			else
			{
				MessageBox.Show("Выберите материал для удаления", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
			}
		}

		//событие попытки закрытия окна,
		// если пользователь выберет Cancel, то форму не закроем

		private void Button_Click_1(object sender, RoutedEventArgs e)
		{
			// Проверяем, выбран ли какой-то материал для редактирования
			if (ListBoxMaterials.SelectedItem != null)
			{
				// Получаем выбранный материал
				Material material = ListBoxMaterials.SelectedItem as Material;

				// Создаем окно редактирования и передаем выбранный материал
				EditMaterialWindow editWindow = new EditMaterialWindow(material);
				editWindow.ShowDialog();
			}
			else
			{
				MessageBox.Show("Выберите материал для редактирования", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
			}
		}
	}
}
