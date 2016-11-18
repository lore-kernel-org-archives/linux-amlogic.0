From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 18 Nov 2016 23:35:19 +0100
Subject: [PATCH 3/3] ARM64: dts: meson-gxbb: add the USB reset also to the
 second USB PHY
In-Reply-To: <m2twb7w1j6.fsf@baylibre.com>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-4-martin.blumenstingl@googlemail.com>
 <m2twb7w1j6.fsf@baylibre.com>
Message-ID: <CAFBinCBVaQ7SLwQ0M2eJj0iyQuErF1Ev5dtGzKr7itiesy11MQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Kevin,

On Wed, Nov 16, 2016 at 10:35 PM, Kevin Hilman <khilman@baylibre.com> wrote:
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
>> When the USB PHY driver was introduced the reset framework did not
>> have support for triggering a reset pulse for shared resets. On GXBB
>> however there is only one reset line for both PHYs (meaning we have a
>> shared reset line). With the latest changes to the reset framework and
>> the corresponding updates to the phy-meson8b-usb2 driver we can now pass
>> the reset to the second PHY as well.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Applied.
Unfortunately I think I put crucial information only in the
cover-letter's description:
"the dts patch has a runtime-dependency on patch 1 and 2"

So please feel free to keep or drop the patch as it is. In case you
decide drop it I will re-send it for 4.11 (after all the 4.10 stuff is
done).
