From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 24 Mar 2017 07:49:04 +0100
Subject: [PATCH v4 05/10] i2c: meson: use full 12 bits for clock divider
In-Reply-To: <20170323203404.nuobb4wtgsepnilu@ninjato>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
 <fbc241ed-ec1e-b433-50af-5d0ebca09711@gmail.com>
 <20170323203404.nuobb4wtgsepnilu@ninjato>
Message-ID: <9858a64d-85de-0798-affc-ab97e36c365b@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 23.03.2017 um 21:34 schrieb Wolfram Sang:
> 
>> +	/* clock divider has 12 bits */
>> +	WARN_ON(div >= (1 << 12));
> 
> Do you insist on WARN_ON? I wonder what it gives over dev_err?
> 
Right, as we just read the bus frequency from DT there's not
really a benefit in seeing the call trace. I'll change it.
