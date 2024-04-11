<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            All Categories
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="container">
            <div class="row">
                <div class="card p-0 col-md-8 overflow-hidden">
                    <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">

                        {{-- Toast --}}
                        @if (@session('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <strong>{{ session('success') }}</strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        @endif
                        {{-- Bootstrap --}}
                        <table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">List No</th>
                                    <th scope="col">Category Name</th>
                                    <th scope="col">User</th>
                                    <th scope="col">Created At</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{-- @php($i = 1) --}}
                                @foreach ($categories as $category)
                                    <tr>
                                        {{-- <th scope="row">{{ $i++ }}</th> --}}
                                        <th scope="row">{{$categories ->firstItem()+$loop->index}}</th>
                                        <td>{{ $category->category_name }}</td>
                                        {{-- <td>{{ $category->user_id }}</td> --}}
                                        {{-- Eloquent --}}
                                        {{-- <td>{{ $category->user->name }}</td> --}}

                                        {{-- Query Builder --}}
                                        <td>{{ $category->name }}</td>
                                        <td>
                                            @if ($category->created_at == null)
                                                <span class="text-danger">Date not set</span>
                                            @else
                                                {{ Carbon\Carbon::parse($category->created_at)->diffForHumans() }}
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{$categories->links()}}
                    </div>
                </div>
                {{-- form  --}}
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Add Category</div>
                        <div class="card-body">
                            <form action="{{ route('store.category') }}" method="POST">
                                @csrf
                                <div class="mb-3">
                                    <label for="category_name" class="form-label">Category</label>
                                    <input type="text" name="category_name" id="category_name" class="form-control"
                                        id="exampleInputEmail1" aria-describedby="addCategory">
                                    @error('category_name')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                {{-- form  --}}
            </div>
        </div>
    </div>

</x-app-layout>
