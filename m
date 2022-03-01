Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDF4C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 05:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBGj9JY92D+7nXSgkRg8oz76cExG3gV+3KAzVhQNd94=; b=onJxquZkLx1PFI
	r/sp9nUADGdcwIWlvbk1qih9C79OwPyiPCrpcynDJYm/VMwcpm8DQJ4qRv1u3sppci1h/ykXfAqcv
	dXTxCKR04mH36zzaenBNptM7i1dgQ5yPBPImovXI9C7pxlZamqfBBhveHeet8/+3MkDD3eeRNmeZW
	8oGeYKBz68WDw1e8h7OhGdgYWIzvqbLT6qQ/R9TMS6UrfYU/yNVD72+sApD18gyNFtAFojVI+Nz/a
	zAvGyWRPJ9qJteJghi2VMj2HVw8O6a3kIsj2CghauaUzn4ng/PX7J24XhgwNqmQ1PVks48sBJu7QM
	XBhoGodrwh0987Ly6n2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOvT6-00F842-V5; Tue, 01 Mar 2022 05:54:40 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOvSn-00F7ui-Mn; Tue, 01 Mar 2022 05:54:23 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 1 Mar
 2022 13:54:18 +0800
Message-ID: <d0da38f1-72c1-d111-2d0d-2bfa2faf1a1d@amlogic.com>
Date: Tue, 1 Mar 2022 13:54:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 0/6] Use CCF to describe the UART baud rate clock
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-serial@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
 <1j8rtvxnkv.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1j8rtvxnkv.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_215421_794236_329794BD 
X-CRM114-Status: GOOD (  14.36  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On 2022/2/28 18:59, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Fri 25 Feb 2022 at 15:39, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> Using the common Clock code to describe the UART baud rate
>> clock makes it easier for the UART driver to be compatible
>> with the baud rate requirements of the UART IP on different
>> meson chips. Add Meson S4 SoC compatible.
>>
>> The test method:
>> Start the console and run the following commands in turn:
>> stty -F /dev/ttyAML0 115200 and stty -F /dev/ttyAML0 921600.
>>
>> Since most SoCs are too old, I was able to find all the platforms myself
>> such as Meson6, Meson8, Meson8b, GXL and so on. I only tested it with
>> G12A and S4.
> 
> GXL based board are still very common an easy to come by.
> I'm quite surprised that you are unable to test on this SoC family
The fact of the matter is that the S4 is our end-2020 chip, the G12A is 
five years old, and the GXL is seven years old. If you must ask for a 
test, I will report this problem to the leadership to coordinate resources.
> 
>>
>> Yu Tu (6):
>>    tty: serial: meson: Move request the register region to probe
>>    tty: serial: meson: Use devm_ioremap_resource to get register mapped
>>      memory
>>    tty: serial: meson: Describes the calculation of the UART baud rate
>>      clock using a clock frame
>>    tty: serial: meson: Make some bit of the REG5 register writable
>>    tty: serial: meson: The system stuck when you run the stty command on
>>      the console to change the baud rate
>>    tty: serial: meson: Added S4 SOC compatibility
>>
>> V6 -> V7: To solve the system stuck when you run the stty command on
>> the console to change the baud rate.
>> V5 -> V6: Change error format as discussed in the email.
>> V4 -> V5: Change error format.
>> V3 -> V4: Change CCF to describe the UART baud rate clock as discussed
>> in the email.
>> V2 -> V3: add compatible = "amlogic,meson-gx-uart". Because it must change
>> the DTS before it can be deleted
>> V1 -> V2: Use CCF to describe the UART baud rate clock.Make some changes as
>> discussed in the email
>>
>> Link:https://lore.kernel.org/linux-amlogic/20220118030911.12815-4-yu.tu@amlogic.com/
>>
>>   drivers/tty/serial/meson_uart.c | 221 ++++++++++++++++++++++----------
>>   1 file changed, 154 insertions(+), 67 deletions(-)
>>
>>
>> base-commit: a603ca60cebff8589882427a67f870ed946b3fc8
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
