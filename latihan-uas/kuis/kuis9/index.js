import React, { useEffect, useReducer, useRef } from 'react';
import { render } from 'react-dom';

import './style.css';
import * as constants from './constants';

const initialState = [...constants.TODOS];
const initialState = [
  {id: 1, name: 'Get started', complete: false}
];

const todoReducer = (state, action) => {
  switch (action.type) {
    case 'ADD_TODO': {
      return (action.name.length)
      ? [...state, {
        id: state.length ? Math.max(...state.map(todo => todo.id)) + 1 : 0,
        name: action.name,
        complete: false
      }]
      : state;
    }
    case 'TOGGLE_COMPLETE': {
      return state.map((item) =>
        item.id === action.id
          ? { ...item, complete: !item.complete }
          : item
      )
    }    
    case 'DELETE_TODO': {
      return state.filter((x) => x.id !== action.id);
    }
    case 'CLEAR_TODOS': {
      return [];
    }
    default: {
      return state
    }
  }

const [todos, dispatch] = useReducer(todoReducer, initialState);}

const Todo = () => {
  const [todos, dispatch] = useReducer(todoReducer, initialState);
  const inputRef = useRef();
  const completedTodos = todos.filter(todo => todo.complete);
  useEffect(() => {
    // inputRef.current.focus();
    document.title = `You have ${completedTodos.length} items completed!`;
  })

  function addTodo(event) {
    event.preventDefault();
    dispatch({
      type: 'ADD_TODO',
      name: inputRef.current.value,
      complete: false
    });
      inputRef.current.value = '';
  }

  function toggleComplete(id) {
    dispatch({ type: 'TOGGLE_COMPLETE', id });
  }
  
  function deleteTodo(id) {
    dispatch({ type: 'DELETE_TODO', id });
  }

  function clearTodos() {
    dispatch({ type: 'CLEAR_TODOS' });
  }

  return (
    <>
      <div className="todo-input">
        <form onSubmit={addTodo}>
          <input ref={inputRef} type="search" id="add-todo" placeholder="Add Todo..." />
        </form>
      </div>
      <div className="column-container">
        {todos.map((todo) => (
          <div className={`column-item ${todo.complete ? 'completed' : null}`} key={todo.id}>
            <div className="flex-container">
              <div className="todo-name" onClick={() => toggleComplete(todo.id)}>
                {todo.name}
              </div>    
              <div className="todo-delete" onClick={() => deleteTodo(todo.id)}>
                &times;
              </div>
            </div>
          </div>
        ))}
      </div>
      <button onClick={() => clearTodos()}>
        CLEAR TODOS
      </button>
    </>
  );
}

render(<Todo />, document.getElementById('root'));