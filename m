From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 29 Nov 2018 23:35:41 +0100
Subject: [PATCH] ARM: multi_v7_defconfig: switch CONFIG_PWM_MESON to
 built-in
In-Reply-To: <7hh8g0d8tg.fsf@baylibre.com>
References: <20181114230554.4968-1-martin.blumenstingl@googlemail.com>
 <7hh8g0d8tg.fsf@baylibre.com>
Message-ID: <CAFBinCBViZgRrZO16FsRKSGNriSw2_D9+_6ri99_zf++_SuuKg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Kevin,

On Thu, Nov 29, 2018 at 1:30 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> > Some Meson8b boards (Odroid-C1, EC-100) use a PWM regulator which is the
> > voltage supply of the CPU cores (this regulator is typically called
> > "VCCK").
> > Now that we are preparing support for CPU frequency scaling on Meson8,
> > Meson8b and Meson8m2 we should build the pwm-meson driver into the
> > kernel so we can configure the CPU voltage early in the boot process.
>
> Can you explain a little more why the configuration of CPU voltage
> cannot wait a bit so this could be properly probed?
I was under the impression that cpufreq-dt would still initialize even
if the regulator is not ready yet. however (after reading the code
again) this is clearly NOT the case.

there's still a benefit with this change: your Odroid-C1 in your
KernelCI lab would also be able to change the CPU frequency (so in
case something breaks we could spot it there).
will you accept this patch after I updated the description to mention
that it's for KernelCI test coverage?


Regards
Martin
