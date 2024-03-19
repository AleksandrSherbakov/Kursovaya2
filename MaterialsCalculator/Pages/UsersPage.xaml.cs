using MaterialsCalculator.Models;
using MaterialsCalculator.Pages;
using MaterialsCalculator.Windows;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MaterialsCalculator.Pages
{
    /// <summary>
    /// Логика взаимодействия для UsersPage.xaml
    /// </summary>
    public partial class UsersPage : Page
    {
        public User user;
        public UsersPage(User user)
        {
            InitializeComponent();
            this.user = user;
            this.LoadData();

        }
        private void LoadData()
        {
            TBLastName.Text = $"{user.LastName}";
            TBFirstName.Text = $"{user.FirstName}";
            TBMiddleName.Text = $"{user.MiddleName}";
            
            // загрузка мероприятий в ListBox сортируем по Дате
            var mce = MaterialsCalculatorEntities.GetContext().Calculations.ToList().Where(p => p.User.UserID == user.UserID);
            ListBoxMaterials.ItemsSource = mce;
            
        }
    }
}
