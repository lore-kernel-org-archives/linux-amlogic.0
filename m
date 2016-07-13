From: frowand.list@gmail.com (Frank Rowand)
Date: Tue, 12 Jul 2016 22:57:16 -0700
Subject: [PATCH v3 2/4] meson-rtc: add device-tree binding
In-Reply-To: <1467748122-14833-4-git-send-email-ben.dooks@codethink.co.uk>
References: <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
 <1467748122-14833-4-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <5785D83C.2000809@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 07/05/16 12:48, Ben Dooks wrote:
> Add documentation for the AMLogic Meson RTC.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/rtc/rtc-amlogic.txt         | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-amlogic.txt

Hi Ben,

I suspect you already know this since you have Rob's ack, but you need to
send bindings to

  Rob Herring <robh+dt@kernel.org>
  Mark Rutland <mark.rutland@arm.com>

-Frank
