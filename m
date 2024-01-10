Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230BAC47073
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jan 2024 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJgPJEE0ElOldcVAfRshQ9z7RBkTuQ/XgwIwau1GJUA=; b=E7nVMjqVge5mzx
	VuXSECs7WtrGRu9PEEG07303nIye18fgKr2+UbgxcJpOuVTgjiHI5MAiStKF3oY2B1WLOvhQzpcqq
	IwaHv+2BzLpQmWYgzb9m0btn3r39NS3yG1eRGVgW1fUUTuNtznpthZzZrwsAS0PJwTtZrQ9m1dNsI
	n8/6oQLn2jtPy1FYz3WD4edeOPnaGWV32UV2FMISAUu9NucT0RIdLjhxyNanRvBaINE62YBqnhPqq
	uxT7kGT0p60xsXPrhtdO6s1xixgSCXnn85G7qxGUD78PdKFkOcSdTddR0XJVT+ikvzzPOD64+b4ai
	wCbYPiikI0IYxjVJ1BBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNfoE-00EBXB-30;
	Wed, 10 Jan 2024 21:08:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNfoC-00EBVK-2o;
	Wed, 10 Jan 2024 21:08:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso47909785e9.0;
        Wed, 10 Jan 2024 13:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704920898; x=1705525698; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sdBkJKGeqx2Ib1rMQ4cwKys6z0bi0e5Co8yXswFscM4=;
        b=c1JaVc9bCjSppTvo/JyFenxH7XvvKzeb0Kn+nSITi4P1dvthAQBdWbSk76R2vBnM3u
         VA45TFCki9tZIpPrHFeYQFVxIMpwHAnkCloMBxqZ77ovcRANrArGTEtemzSZISpCysdA
         BBIHt0ciOUCoeZ1xdUplgqRV+4KHglMbHBcpLH7V5ZiEW2SDJaieRJpXWbnzkyxWHFkp
         ojPDrudZsq8s9OPEeMC/tTr3RthgjLcezIRwYeVb/qPeN0jpr+H20K+MVZrZJN0OlejF
         PQLe/uhTUQZP+fGMs9KAWBZPQgDWNwmRDf7PNaRBwoyQRHxbzE6EZvX+ezC54kMb0sPU
         Y5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704920898; x=1705525698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdBkJKGeqx2Ib1rMQ4cwKys6z0bi0e5Co8yXswFscM4=;
        b=WxSsBjPpJP14Z0Jn5nC1XnsaKdjThx9pbfsb27e7WKJlyItWqWCpIDvE9HgaPl+6JU
         bmnsZKvFZNWDYRaCcGZ0U3GYa2GiUSf1RbAQdt00QjhtrJZICC4gPIj6P8NRwZoDQo2Y
         2YVkLQs8WKdm4seu3omjxvRp7WcR8RmvywNSMlaz0mOJC1QHZ/aMO6N9uPYAWiUjGr8v
         5ragZz+/WQaRzzLERfa7TSAPJcrHMJdq2ixkZ762aB5hHBCTiJQ5WlGpO/rdFl1hax1I
         9ebWsE+XBppp4r/EB9VZ89HSVJ4V+G2XLNDgNcTNaLp1jK6peA5a9vzSWlwuzgruPfcV
         EIQQ==
X-Gm-Message-State: AOJu0YzTwT8Fx/Pn/KOUuKuiPxc8CdnnEYhhNr3e4squ/HNKRbJ3tLgN
	E4JaYT8jzavTQ8mgVEeDkFo=
X-Google-Smtp-Source: AGHT+IEnV73X93ipcA+KqaG2Dc/CRaCkLE83o8sdCdrKdhcEffrQDt94qGVTchMbAPVOs4q40slv7g==
X-Received: by 2002:a05:600c:2246:b0:40e:455f:fdbb with SMTP id a6-20020a05600c224600b0040e455ffdbbmr9115wmm.280.1704920897638;
        Wed, 10 Jan 2024 13:08:17 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id w10-20020a5d680a000000b003376af392e5sm5670428wru.38.2024.01.10.13.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 13:08:17 -0800 (PST)
Date: Wed, 10 Jan 2024 22:08:15 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, clabbe@baylibre.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	artin.blumenstingl@googlemail.com, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v1 00/24] Support more Amlogic SoC families in crypto
 driver
Message-ID: <ZZ8HP7dJgVaZLMw5@Red>
References: <20240110201216.18016-1-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110201216.18016-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_130820_931844_A126FC2D 
X-CRM114-Status: GOOD (  11.29  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Le Wed, Jan 10, 2024 at 11:11:16PM +0300, Alexey Romanov a =E9crit :
> Hello!
> =

> This patchset expand the funcionality of the Amlogic
> crypto driver by adding support for more SoC families: =

> AXG, G12A, G12B, SM1, A1, S4.
> =

> Also specify and enable crypto node in device tree
> for reference Amlogic devices.
> =

> Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> custom tests and trcypt module.

Hello

Thanks for your patch series.
Unfortunatly, I fail to apply it for testing on top of linux-next.
On top of which tree did you have tested ?
According to patch 01, you used a tree based before "crypto: amlogic - Use =
new crypto_engine_op interface" so too old.

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
