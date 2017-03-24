From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 24 Mar 2017 07:47:14 +0100
Subject: [PATCH v4 04/10] i2c: meson: use i2c core for DT clock-frequency
 parsing
In-Reply-To: <20170323203309.op7jepa4be2mwkop@ninjato>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
 <96c1b005-063e-ae22-ded4-fbb0b023f02b@gmail.com>
 <20170323203309.op7jepa4be2mwkop@ninjato>
Message-ID: <6aa0f7c1-1bd0-73eb-e05f-f733125bec8d@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 23.03.2017 um 21:33 schrieb Wolfram Sang:
> 
>> +- i2c-scl-falling-time-ns
>> +  Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
>> +  specification.
>> +
>> +- i2c-scl-internal-delay-ns
>> +  Number of nanoseconds the IP core additionally needs to setup SCL.
>> +
>> +- i2c-scl-rising-time-ns
>> +  Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
>> +  specification.
>> +
>> +- i2c-sda-falling-time-ns
>> +  Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
>> +  specification.
> 
> Those are not used currently. Can the driver be updated to make use of
> them? Otherwise, we might just skip this section.
> 
Adding these properties was outcome of a discussion with Amlogic
maintainers. It's right that they aren't used by the driver and the
chip also provides no means to change the related timings.
So I will remove this part.
