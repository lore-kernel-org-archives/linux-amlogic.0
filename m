Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F8CEFCE4B
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 21:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCp0adOD37DeRPjNwId4REikBb1wWATX5tCy8v/MQVI=; b=YWK9s2Z2Gms9iN
	mIFpyzhnK4lDywHolvgu26MapGt3bcms2yIIwzB8jTo1C9KG42/h3AD1Pqf79kfzXqUfk7jtpypr4
	vQOfbvfK9Ly0QP8Scivol6nBEeoIm8Ez9F/Ypa+uxlZDGUHXyCNprdF6RT6gjVPSvy8Z3pPnBnEcT
	dxyUfA2Tn3hhkvmdWxkcQxovfZx2KpVgF0U2SWpQpc2GL22/2q0K8mm0qAeTBwuNiN8PRJFzH9nVD
	uV9czWCj4HDPZmp1Wlg/9u1JPwIS4rcvs36lt4H8wzPWj7WeDRTKvdPp4pCAYW5sfJnRtLmdmwAzu
	mV5yd5eHl5b5ZZXUBObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuEn-00000000YH1-2NEq;
	Wed, 04 Mar 2026 21:58:37 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuEk-00000000YFO-1q4g
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 21:58:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82985f42664so3634b3a.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661513; x=1773266313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=OXgPhLEV5MmqjCJLZ7s2p7wuQWn8dJqRHO9wYvWbXwlZEQnfHYs+MwGVCvuKSfo0tj
         /PVaOj7phOk7Hyaer6/2+uPYP/opqR0w0Db8Y7pOUr5ZlLWiBFHJFbIJCG2w0pvsoEps
         oPEWRb/lDISYpNUyOg12NvWvFerTYldm5paa/a69RsCs2BQgEBKbn91CiX9vCqjhW5tR
         OYxv2eMNsT2Oi1ofgn5sC8m274j7nCZb5HQFSslL7kB05NrgoODLdm4sMIijdAY0L/zd
         oy11gcq2CaCyAjB8Vj5YvXjPmkqUlyV0dpzKr+tltizQ2s2/U45Vn2YkWP7VJOOwxSOM
         58rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661513; x=1773266313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=JF+231IEBEzIcr8ckRM/RT9cThKJa397A3jUpv3IjP5fSMH4zdBTDjWW84MxPHiKKe
         yvQwocYS57QSdohB3vk1ev+ZLDmtWblfunEdGI4O3W9g8lo5NQNqoSqa9MLUCpOAk/gY
         7uPMI+vnjqKmKtAV96OP3bwXFfAeYwzBAmepd47yNjvDinS1VFYlgkmG1r0aOx5DaWC9
         fZL5I2kNrX47JQ7owUpqkaWXcf5Mmb8PCQHVfMWkQOpF+oiilpmw3VFdn4AsFe0i/O70
         bB8Bj3IdQ5PMlMnUzwibS9tMfYuFAluOHWSZj9lp7o+xJxFNEUQmvwHxRzsjkYvCCB5/
         +Y7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWO9A/3JpSQDED/FDzEJptMtSUlcjWgKnoFsSc5SGOVQsn5ihnsFhIFvkydQmwRaZkrE7EnEx2YOqJvVbNP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7L6Apf7hCITL8v8OaGOeBnPQRyG6rgV74HXplcLeVxFnbJ6wX
	6repb52XwDMBbM7e5q3XZOCuAfYIVDABXFk91UdkFAZytIQ/5Ngfh9xC
X-Gm-Gg: ATEYQzwNrH0Wfk0S1/sWRO6d0ZqxKiRzSfuYtk+D+tWcB7YIiVIWMpSmK4fjh5OIgOE
	phZReIptsu8p60cFPADx3+j6uokO/GiMXw7tuUvhwKuDVOg7VaOuv6iiVdqcq3A65gXI8/N7yqr
	U1GNu0wJ5BtIiHGxf0dq15u0v+oumPOoED/ZVywemcbRFbZHLgOt6i0EI96jXZDcFSh52XS/gvt
	ogc9DCuAwDKewO37GJ05gFY3ICgvonk6/WCLePeoCfBlcx1NxR0nMtotrKHtMM6VlWg2nf0UF0E
	mrfC3//dO5MH5186hv5zICZhN1y21pWqtfPJdaHmczV9VYFq6qCanMnsgKTf7PwnJA/AqPlSohB
	PZbPFxJsEQde4quVDcj6rgHW96aLgu/83l96yFY6ATNHDRWLK3VtI7emwLcXfZzOGjnvmXi0mLi
	61UiZkFgul76/geViLtcD7RcC7xPzEmD/7kNGt
X-Received: by 2002:a05:6a00:4288:b0:827:3321:7a23 with SMTP id d2e1a72fcca58-82972b63764mr2746760b3a.24.1772661513098;
        Wed, 04 Mar 2026 13:58:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82984a01827sm110603b3a.43.2026.03.04.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:58:32 -0800 (PST)
Date: Wed, 4 Mar 2026 13:58:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
Message-ID: <a1ce9ab4-49cc-46f7-8524-1cbc0e6333fa@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_135834_476776_B10811EF 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Mar 04, 2026 at 10:02:30AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
