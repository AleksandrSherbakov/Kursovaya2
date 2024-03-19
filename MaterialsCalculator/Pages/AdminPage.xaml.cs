using System;
using System.Windows.Controls;
using MaterialsCalculator.Models;
using MaterialsCalculator.Windows;
using System.Windows;
using System.Windows.Media.Imaging;
using System.Windows.Threading;

namespace MaterialsCalculator.Pages
{
	/// <summary>
	/// Логика взаимодействия для AdminPage.xaml
	/// </summary>
	public partial class AdminPage : Page
	{
		public User user;
		public AdminPage(User user)
		{
			InitializeComponent();
			this.user = user;   
		}
		
		private void Button_Click(object sender, RoutedEventArgs e)
		{
			AddMaterialWindow addWindow = new AddMaterialWindow();

			addWindow.ShowDialog();
		}

		private void Button_Click_1(object sender, RoutedEventArgs e)
		{
			DeleteMaterialsWindow delWindow = new DeleteMaterialsWindow();

			delWindow.ShowDialog();
		}

		
	}
}
