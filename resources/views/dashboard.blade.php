<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Welcome Back... {{ strtoupper(Auth::user()->name) }}
            <b style="float: right;"> Total Reigstered Users:
                <span class="badge bg-warning">{{ count($users) }}</span>
            </b>

        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                {{-- <x-welcome /> --}}
                {{-- Bootstrap --}}
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Sequence No</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Created</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php($id = 0)
                        @foreach ($users as $user)
                            <tr>
                                <th scope="row">{{ ++$id }}</th>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                {{-- Time starts at minutes works only on eloquent --}}
                                {{-- <td>{{ $user->created_at->diffForHumans() }}</td> --}}

                                {{-- Time starts at minutes works only on Query Bulider --}}
                                <td>{{ Carbon\Carbon::parse($user->created_at)->diffForHumans() }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</x-app-layout>
