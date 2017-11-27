From: sjg@chromium.org (Simon Glass)
Date: Mon, 27 Nov 2017 10:09:56 -0700
Subject: [PATCH 2/4] i2c: meson: reduce timeout
In-Reply-To: <20171126164057.27728-3-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
 <20171126164057.27728-3-b.galvani@gmail.com>
Message-ID: <CAPnjgZ2-BvoNcDr9cnY7HZ4Z1Stp8VQjAcvuVxEUzioNOcR36Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 26 November 2017 at 09:40, Beniamino Galvani <b.galvani@gmail.com> wrote:
> The datasheet doesn't specify a suggested timeout and 500ms seems very
> long: reduce it to 100ms.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  drivers/i2c/meson_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
