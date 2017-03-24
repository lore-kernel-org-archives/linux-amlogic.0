From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 24 Mar 2017 07:45:25 +0100
Subject: [PATCH v4 03/10] i2c: meson: set clock divider in probe instead
 of setting it for each transfer
In-Reply-To: <20170323203156.jjsiu7hydebzh66l@ninjato>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
 <c85a5f83-0013-001e-6c2d-3fe66c5267aa@gmail.com>
 <20170323203156.jjsiu7hydebzh66l@ninjato>
Message-ID: <de85eb92-d3b0-fdc4-2de0-f2b5f8e3436f@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 23.03.2017 um 21:31 schrieb Wolfram Sang:
> On Tue, Mar 14, 2017 at 10:53:29PM +0100, Heiner Kallweit wrote:
>> The bus frequency won't change, therefore we can set the clock divider
>> in probe already and we don't have to set it for each transfer.
> 
> This is true for some SoCs, but not for all. So, some proof we can
> really do it like this would be nice in the commit message, e.g. "parent
> clock is fixed anyhow" or something.
> 
Here the bus frequency is fixed to what is set in DT. I'll extend
the commit message.

>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
