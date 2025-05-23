import React from 'react'
import { Link } from 'react-router-dom'
import { Zap, Briefcase, User } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { useNavigate } from 'react-router-dom'

const Navbar = ({ userType }) => {
  const { user, logout } = useAuth()
  const navigate = useNavigate()

  const handleLogout = async () => {
    await logout()
    navigate('/')
  }

  return (
    <nav className="bg-white shadow-sm">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between h-16 items-center">
          <div className="flex items-center">
            <div className="flex-shrink-0 flex items-center">
              <Zap className="h-6 w-6 text-indigo-600" />
              <h1 className="text-xl font-bold text-indigo-600 ml-2">
                AI Quiz
              </h1>
            </div>
            <div className="hidden md:block ml-10">
              <div className="flex space-x-8">
                <Link
                  to="/"
                  className="text-gray-700 hover:text-indigo-600 px-3 py-2 text-sm font-medium"
                >
                  Home
                </Link>
                <Link
                  to="/#features"
                  className="text-gray-700 hover:text-indigo-600 px-3 py-2 text-sm font-medium"
                >
                  Features
                </Link>
                <Link
                  to="/#how-it-works"
                  className="text-gray-700 hover:text-indigo-600 px-3 py-2 text-sm font-medium"
                >
                  How It Works
                </Link>
                <Link
                  to="/#testimonials"
                  className="text-gray-700 hover:text-indigo-600 px-3 py-2 text-sm font-medium"
                >
                  Testimonials
                </Link>
              </div>
            </div>
          </div>
          <div className="hidden md:block">
            <div className="ml-10 flex items-center space-x-4">
              {user?.role === 'candidate' ? (
                <>
                  <Link
                    to="/candidate/dashboard"
                    className="text-gray-700 hover:text-indigo-600 px-3 py-2 text-sm font-medium flex items-center"
                  >
                    <User className="h-4 w-4 mr-1" /> Dashboard
                  </Link>
                  <button
                    className="px-3 py-2 text-sm font-medium text-gray-700 hover:text-indigo-600"
                    onClick={handleLogout}
                  >
                    Logout
                  </button>
                </>
              ) : user?.role === 'recruiter' ? (
                <>
                  <Link
                    to="/recruiter/dashboard"
                    className="text-gray-700 hover:text-indigo-600 px-3 py-2 text-sm font-medium flex items-center"
                  >
                    <Briefcase className="h-4 w-4 mr-1" /> Dashboard
                  </Link>

                  <button
                    className="px-3 py-2 text-sm font-medium text-gray-700 hover:text-indigo-600"
                    onClick={handleLogout}
                  >
                    Logout
                  </button>
                </>
              ) : (
                <>
                  <Link
                    to="/candidate/login"
                    className="px-4 py-2 rounded-md text-sm font-medium text-indigo-600 hover:bg-indigo-50"
                  >
                    Candidate Login
                  </Link>
                  <Link
                    to="/recruiter/login"
                    className="px-4 py-2 rounded-md text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700"
                  >
                    Recruiter Login
                  </Link>
                </>
              )}
            </div>
          </div>
        </div>
      </div>
    </nav>
  )
}

export default Navbar
