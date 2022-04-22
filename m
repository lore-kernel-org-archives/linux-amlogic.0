Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB447C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Apr 2022 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcUNVe+gdO0wjW23Dtxud+4oBpAKdGSJ2I9OtjO72ww=; b=oF17qw6K5KxZeh
	JJyityYSoolAMg3xod0BWYOCMCOsuM3YrdLywDOUaI6VXZZHXQ+cI7bSloNmR+HyER7uG1LvXlg8v
	Htu+Y8QENQnepHqDirBrwuApTvZmT9OJmqugNES3ZEOklZFlMhzOc49XPPi+QkAHCGexNENojtpB7
	IeKEdkQGPrNZWbMMCir+uJURVRxdUM+qJS+XrP72PSoBS7cGJdUQ2W599Pl7+hBI16I1UcYcIbMat
	FZ6TDAEk7/aAmu2a9EKEuutEOnnZDJ8XzXbieHa13wdgIVqfUW1GJlay4mWMStsFqNTGi1IzFbdU3
	Yk1ZJN4Zr6+503jEf1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhsS8-000PmF-EV; Fri, 22 Apr 2022 12:32:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhsR0-000PAU-8Z
 for linux-amlogic@lists.infradead.org; Fri, 22 Apr 2022 12:30:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id bg25so4300845wmb.4
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Apr 2022 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uYpfhyLIZUoxSaL7aclvytyYyaHl2rC8E7mXVViSyfc=;
 b=uRlDT3KghQ72J48ecDEdO6TbGuBv79C9de1+zDTZgknkJmgnuE/r1vj8Pz3Rt8qy2R
 HrMpv6ImE2wqji+7uwsnk6qL3uQlr6zXL8QIjGiKTPnfXN14BI+JUnT0BpBKQTav9Wmv
 MfU06RpRMiFymu9hXeZCZY8UAdetQOws9cngYkAH9J2Goqd0yJnUVmWUqkw5ut9Htguj
 gxJmTGiY1eo4el2mxgnzb6RTc/wlYvqM21V/BQfkMg7FC2c7W+I04t/QCnxIVObffiQq
 Qi5kisx98/GiAN0p27vcH4dV1tn1mPpR2pmdCcMaIiN+sisPBq5r9N/irdTLx3xxh2B7
 5yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uYpfhyLIZUoxSaL7aclvytyYyaHl2rC8E7mXVViSyfc=;
 b=RoViMzlhrpBUrBpKB7Wtl59ury12qOnpQG8Hh2He9SqHXFG9sk8LODaKtSJfqSSv88
 KeQq4Lvv1oI18aBp27L5i7ARDiPXaaBXrQwisa93SiOsYJtkfF1IPMcBVQGt5HTcpOud
 XIxRSKrk2CLnHS21B/+mG9CcL3/wWnOFdOhB4EGIebEUvM1IZNdYrrSdaPCwLvNUUvuR
 WI1EnDQY5zp7+s4VoWw+tFgQLXdKEioPKSbP56YozsyhytC6tsnxUoC8/yzIvwRgv/xS
 YiAc7gneIP8/7nlfWh8lxrvd+e0j66b8O/QtKrLkrm6bB/dZZyyQumxfbxRwADr7r2Pq
 xcVA==
X-Gm-Message-State: AOAM533doVfAE7SJ+5d/Nb7cLQLQfTbgcBALs6+9NPREOcFV8TZQFRVE
 YjJezmYxyF7rb21oN0wUuFQR9Q==
X-Google-Smtp-Source: ABdhPJz+Jz9pR1hcwEuMnRxUjM1J9wCJDr7UgRKwD7/jIw3O0t/ayEtSDbmDFocJ9N4ZPRpi3INr+A==
X-Received: by 2002:a05:600c:3ac8:b0:392:a821:7975 with SMTP id
 d8-20020a05600c3ac800b00392a8217975mr13087552wms.138.1650630645810; 
 Fri, 22 Apr 2022 05:30:45 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49?
 ([2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a05600002aa00b0020a7cc29000sm1766232wry.75.2022.04.22.05.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:30:45 -0700 (PDT)
Message-ID: <3406cabe-4fac-ce1c-d710-ccd5f628aaaf@baylibre.com>
Date: Fri, 22 Apr 2022 14:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 0/2] Add q 12MHz internal clock rate to calculate
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220422111320.19234-1-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220422111320.19234-1-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_053050_329401_6FEC844C 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

On 22/04/2022 13:13, Yu Tu wrote:
> 1.Added 12Mhz as the clock source for calculating baud rate.
> 
> 2.Added S4 SOC compatibility.
> 
> 
> Yu Tu (2):
>    tty: serial: meson: Add a 12MHz internal clock rate to calculate baud
>      rate in order to meet the baud rate requirements of special BT
>      modules
>    tty: serial: meson: Added S4 SOC compatibility
> 
> V1 -> V2: Change format as discussed in the email.
> V2 -> V3: Change format as discussed in the email.
> 
> Link:https://lore.kernel.org/linux-amlogic/20220418053202.24528-2-yu.tu@amlogic.com/
> 
>   drivers/tty/serial/meson_uart.c | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 05fe70dd2efd13de700c2dfe5169d3a7a5050bc2

Thanks for this v3, all fine for me !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
