From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 29 Nov 2018 16:51:10 -0800
Subject: [PATCH] ARM: multi_v7_defconfig: switch CONFIG_PWM_MESON to
 built-in
In-Reply-To: <CAFBinCB8r+5tGKxfsPMapayxmDuWOi=WihvvdxS=UxcnpeYqdQ@mail.gmail.com>
References: <20181114230554.4968-1-martin.blumenstingl@googlemail.com>
 <7hh8g0d8tg.fsf@baylibre.com>
 <CAFBinCBViZgRrZO16FsRKSGNriSw2_D9+_6ri99_zf++_SuuKg@mail.gmail.com>
 <7hk1kv79at.fsf@baylibre.com>
 <CAFBinCB8r+5tGKxfsPMapayxmDuWOi=WihvvdxS=UxcnpeYqdQ@mail.gmail.com>
Message-ID: <7hefb375hd.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Fri, Nov 30, 2018 at 12:28 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>
>> > Hi Kevin,
>> >
>> > On Thu, Nov 29, 2018 at 1:30 AM Kevin Hilman <khilman@baylibre.com> wrote:
>> >>
>> >> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>> >>
>> >> > Some Meson8b boards (Odroid-C1, EC-100) use a PWM regulator which is the
>> >> > voltage supply of the CPU cores (this regulator is typically called
>> >> > "VCCK").
>> >> > Now that we are preparing support for CPU frequency scaling on Meson8,
>> >> > Meson8b and Meson8m2 we should build the pwm-meson driver into the
>> >> > kernel so we can configure the CPU voltage early in the boot process.
>> >>
>> >> Can you explain a little more why the configuration of CPU voltage
>> >> cannot wait a bit so this could be properly probed?
>> >
>> > I was under the impression that cpufreq-dt would still initialize even
>> > if the regulator is not ready yet. however (after reading the code
>> > again) this is clearly NOT the case.
>>
>> Hmm, a quick look at cpufreq-dt suggests that it should -EPROBE_DEFER if
>> the regulator isn't ready yet.  Why doesn't that work?
> sorry for not being clear:
> I was under the impression that cpufreq-dt wouldn't handle -EPROBE_DEFER.
> I'm not sure why I assumed that. As you already said: deferred probing
> of the regulator works fine.
>
>> > there's still a benefit with this change: your Odroid-C1 in your
>> > KernelCI lab would also be able to change the CPU frequency (so in
>> > case something breaks we could spot it there).
>> > will you accept this patch after I updated the description to mention
>> > that it's for KernelCI test coverage?
>>
>> Possibly, but I'd still rather see the dependencies worked out correctly
>> so that this can be module, and cpufreq-dt would defer until it's ready.
> KernelCI shows multiple "pwm-regulator regulator-vcck: Failed to get
> PWM: -517" messages on Odroid-C1.
> however, what I failed to notice so far is that there's a
> "pwm-regulator: supplied by regulator-dummy" at the end of the boot
> process. does this mean that the Odroid-C1 in your KernelCI lab can
> load kernel modules? in that case this patch can be ignored.

All boards in my lab can load modules.  The boot with a minimal
buildroot-based ramdisk that uses eudev, so any drivers that are present
in DT will be loaded (if they're modules) or probed.

> (I will still send a PWM regulator related patch: that "Failed to get
> PWM: -517" message is very noisy and we typically suppress that in
> other drivers)

Sure, no objections to that one.

Kevin
