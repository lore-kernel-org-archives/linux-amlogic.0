From: sjg@chromium.org (Simon Glass)
Date: Fri, 14 Jul 2017 07:50:22 -0600
Subject: [PATCH v2 3/4] odroid-c2: enable GPIO
In-Reply-To: <20170709223006.3998-4-b.galvani@gmail.com>
References: <20170709223006.3998-1-b.galvani@gmail.com>
 <20170709223006.3998-4-b.galvani@gmail.com>
Message-ID: <CAPnjgZ0K9B36mO9c_X6fJ=ay94tKTfHePPVbGEU7qvZ=mOc+1A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 9 July 2017 at 16:30, Beniamino Galvani <b.galvani@gmail.com> wrote:
> GPIOs are now supported on Meson GXBB, enable driver and command in
> the config.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  configs/odroid-c2_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
