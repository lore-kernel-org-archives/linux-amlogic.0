Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B63CC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Apr 2022 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYbbgAATFFMQ3dHSQUrasSFFJRjK6RdNtY6yUaHpQnY=; b=cTxAmDuzf+JLDI
	LdUy7s2VLb971LlbaEikuHpRVImcTIFRJfSjxqnsAODaF3vol016VS4QFFCqnX6r1YoWIDbstg9ny
	G875x5GljDVDoPoNAmXJ/a9DQcEHu5aLzOUyfQGfj6YsrZXlHcpiMV5gdJllJHZeJbz9v39eUFor2
	0oxTeT6BxYH1bKiDgKkwreUNc+wSRtuwX12hqZf7P0FazJtLUdIX2c9syoJdMPRYPm1ssQSmmSJu4
	M+AD4GkvEQBJw7yimUvvusaHrONcil0yGA1Nv1m/Jpz1cyyuFWrah1f3CslZmdE0RILE+ENG217Cj
	6yEwGSyB33qSSUS31X6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiY1-0027Cz-VM; Tue, 19 Apr 2022 07:45:18 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiIl-001ztS-7c; Tue, 19 Apr 2022 07:29:37 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 19 Apr
 2022 15:29:20 +0800
Message-ID: <d10e27ff-e674-87bd-2c98-63c7040baeb1@amlogic.com>
Date: Tue, 19 Apr 2022 15:29:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Jiri
 Slaby <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-2-yu.tu@amlogic.com>
 <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_002931_352039_22A9E79B 
X-CRM114-Status: GOOD (  11.24  )
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

Hi Andy,
	Thank you for your advice.

On 2022/4/18 20:09, Andy Shevchenko wrote:
> [ EXTERNAL EMAIL ]
> 
> On Mon, Apr 18, 2022 at 8:50 AM Yu Tu <yu.tu@amlogic.com> wrote:
>>
>> A /2 divider over XTAL was introduced since G12A, and is preferred
>> to be used over the still present /3 divider since it provides much
>> closer frequencies vs the request baudrate.Especially the BT module
> 
> 'e. E' (mind the space)
My statement is a whole. There should be no spaces.
> 
>> uses 3Mhz baud rate. 8Mhz calculations can lead to baud rate bias,
>> causing some problems.
> 
> ...
> 
>> +struct meson_uart_data {
>> +       bool has_xtal_div2;
> 
> I would prefer to see this as an unsigned int and with a less
> particular name, e.g. xtal_div would suffice.
I don't have a problem with your suggestion.Let's see What Neil has to say.
> 
>> +};
> 
> ...
> 
>> +               unsigned int xtal_div = 3;
> 
>> +               if (private_data && private_data->has_xtal_div2) {
>> +                       xtal_div = 2;
> 
> Better to define privata data always
> 
> 
>> +                       val |= AML_UART_BAUD_XTAL_DIV2;
>> +               }
>> +               val |= DIV_ROUND_CLOSEST(port->uartclk / xtal_div, baud) - 1;
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
