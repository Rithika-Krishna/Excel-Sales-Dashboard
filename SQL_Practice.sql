create database prac;
use prac;
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(30),
  salary INT,
  hire_date DATE
);

CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  emp_id INT,
  sale_amount INT,
  sale_date DATE,
  region VARCHAR(20),
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
INSERT INTO employees VALUES
(101, 'Riya', 'Marketing', 50000, '2021-03-01'),
(102, 'Tanish', 'Sales', 55000, '2022-06-12'),
(103, 'Hansi', 'IT', 60000, '2020-09-10'),
(104, 'Freddy', 'Marketing', 52000, '2021-11-22'),
(105, 'Lisa', 'Sales', 58000, '2023-01-15');

INSERT INTO sales VALUES
(1, 102, 120000, '2023-01-12', 'South'),
(2, 105, 150000, '2023-02-14', 'East'),
(3, 102, 80000, '2023-03-05', 'South'),
(4, 101, 90000, '2023-03-07', 'North'),
(5, 105, 140000, '2023-03-18', 'West'),
(6, 104, 100000, '2023-04-01', 'North');

select name from employees;
select sale_amount from sales where sale_amount>"100000";
select name from employees order by salary desc limit 2,1;
#Sales by Region
select region,sum(sale_amount) as SUM from sales group by region;
# Show employee names with their total sales
SELECT e.name, SUM(s.sale_amount) AS total_sales FROM employees e JOIN sales s ON e.emp_id = s.emp_id GROUP BY e.name;
# List employees who made no sales
SELECT e.name from employees e left join sales s ON e.emp_id = s.emp_id where s.sale_amount is null;
# Show average salary by department
SELECT e.department, AVG(s.sale_amount) AS avg_sales FROM employees e LEFT JOIN sales s ON e.emp_id = s.emp_id GROUP BY e.department;
# Which regions have total sales > ₹2,00,000?
select region, sum(sale_amount) as sum from sales group by region having sum(sale_amount)>200000;
#Employees hired after Jan 1, 2022
select emp_id from employees where hire_date>'2022-1-1';
# Sales made in March 2023 
select sale_amount from sales where sale_date between '2023-03-01' and '2023-03-31';
#Average Sales by Department
select e.department ,avg(s.sale_amount) from employees e  left join sales s on e.emp_id =s.emp_id group by e.department;	
#Top 3 Employees by Total Sales
select e.name ,sum(s.sale_amount) as TS from employees e join sales s on e.emp_id= s.emp_id group by e.name order by TS desc limit 3;
#employee with no sales
select e.name from employees e left join sales s on e.emp_id = s.emp_id where s.sale_amount is null;
SELECT e.name, e.department FROM employees e LEFT JOIN sales s ON e.emp_id = s.emp_id WHERE s.sale_id IS NULL;

select * from sales;
select * from employees e left outer join sales s on  e.emp_id = s.emp_id;



