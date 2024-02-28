Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D25BC5478C
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Feb 2024 20:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zov1plVM+0uPlm7z031dYfa8uSWiPQSFO+J2GhYoUaQ=; b=x1oSNd/3Q8jIgn
	W7MiFtTThiQ7EdGgZqIj1NAvIYZeXeZIsiY3g5XserMJiZ4K3RRFX/FzsoZFGuYfCRCfnRdvNX6Kd
	5cnILeMOo926F8D8bD8OH5jUIE0vzm40TSsyT/6fjZxGmt/fuEdLWgX1jTB0NG/pSpwIwT0bVtsD6
	hiL49g2Ek2CJdmeBIXjnxlPq6BvY9YluAR/HZsfHHu9io8+NdbSnVrY5pSWm4X+B8jVLWRNlPf7xw
	F65oNBHjK8lptdunS8Ff8Fu/ejC6bWf0QnnxKsDqwPfqdRtmF4/++TXlCtAUP2KMw1FxO9vX4rQeu
	ZXX5y6nAQFQ2KquKBo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfQOy-0000000ApQM-36sr;
	Wed, 28 Feb 2024 20:19:40 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfQOv-0000000ApOd-231G;
	Wed, 28 Feb 2024 20:19:39 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d09cf00214so1628441fa.0;
        Wed, 28 Feb 2024 12:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709151575; x=1709756375; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AaYkftKp1y11sdAWaYMn4v1B8t9t+mmU/Hhe9qMT1cc=;
        b=HJ1DGjxHmt5A3NlLa1P1rXdpqCD2BzdMf4E8R+Ic4eKcdCdvKuN9nnZy9TPGKLLFOv
         N8hYln9GaTkNRiyetdYMp4blsCpRJ4STW9o2bDdzlCUFPUVEZUOlw+LgLaaAkjTk7Z1l
         8oenfgZ1gsSaFNVLZEVWFlirHP8ZX2yrYQ6mOyc4Tq7/07YCLs35G9Q/1GnwyRo+1STB
         Zcc+rnJxObIyMogpmilqnYLNmzUPBo/jiqa2RhF/slcDh+7NmyHeaGRqPU3AGvnslj0E
         eRMw49QkP2tZrBk79wnXuiwvSFidoun7VKKU8gxHc/oqwhS+4vGIpZ4lTPMU9tsumj2P
         wIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709151575; x=1709756375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AaYkftKp1y11sdAWaYMn4v1B8t9t+mmU/Hhe9qMT1cc=;
        b=bJTkLYZNdOMx9lYKcT/cZbOe21Ig7WVIXxosVXHv5hK7B0/PLtu9l0jeuEgefcfs5X
         I5RbJRuKALoc6aBpThkhJ5n9Nz3sCjbWDjzG7dDyskL/D/+H1QQq+pIwElaljy9jzt7Y
         SIYkK4Mn7YpCjsqNQpwOljvQfXKX7JpeYHXwvmiqUPL9vVX5/lI3zu2iplxOgcp2oGkX
         5sBrKM2i9ECvtxgI1XDOQQrX8s1Zq9ZdQzd8TY9JmzkS0vz/5qFOmBo6fofwuC0aFWpE
         LmCI85wDu6ZdvQlp483bp/A99RvoDOaLJoSv4gFHjkHpZN3mv4p9VO9uEJXdqmzGyeqT
         0lfA==
X-Forwarded-Encrypted: i=1; AJvYcCW03HuNGU8QqlEdfIm/S3LfckUCINTBOykuTYrcMJ6+n5mIalwvy1G5VpRy0i0wU6iQ3fs4XSnzH9Pc+3EPgjiq6IlfhndTbh4Y7xUTX8VN50Z4nsXSPsVFvBEKT2h6S1S8VHV4/ZoK1XbgA2DOsJ9AoBOi0ZSiow==
X-Gm-Message-State: AOJu0YxyrWhWX8NryunxXPGQdKuLha6lxOenpy6ne2lWwk8l5v2enOM5
	wpAuYCtD7Kb8LCsV3ZMwExNSe6Xd7YKhJ51ApT3ZHF4R0WcmV1aG
X-Google-Smtp-Source: AGHT+IEmzFheUvrhk7elS7+uTO42EaEZigwC+piudVPdSqGPkd8eJkZq1RdUGfSUAb28YaMidt4oZQ==
X-Received: by 2002:a2e:978b:0:b0:2d2:a4e2:bb84 with SMTP id y11-20020a2e978b000000b002d2a4e2bb84mr3894714lji.47.1709151574660;
        Wed, 28 Feb 2024 12:19:34 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id bk25-20020a0560001d9900b0033dd98c518bsm10293993wrb.50.2024.02.28.12.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 12:19:34 -0800 (PST)
Date: Wed, 28 Feb 2024 21:19:32 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
Message-ID: <Zd-VVGXHoH2ikbmV@Red>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <ZcsYaPIUrBSg8iXu@Red>
 <20240215104719.njq6ie2niisntcnv@cab-wsm-0029881.sigma.sbrf.ru>
 <ZdL713ae1swwTU_B@Red>
 <20240228133656.24bic6djmjvkill7@cab-wsm-0029881>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240228133656.24bic6djmjvkill7@cab-wsm-0029881>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_121937_558154_6863B3F2 
X-CRM114-Status: GOOD (  21.09  )
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

Le Wed, Feb 28, 2024 at 01:37:02PM +0000, Alexey Romanov a =E9crit :
> Hello,
> =

> On Mon, Feb 19, 2024 at 07:57:27AM +0100, Corentin Labbe wrote:
> > Le Thu, Feb 15, 2024 at 10:47:24AM +0000, Alexey Romanov a 'ecrit :
> > > On Tue, Feb 13, 2024 at 08:21:12AM +0100, Corentin Labbe wrote:
> > > > Le Mon, Feb 12, 2024 at 04:50:48PM +0300, Alexey Romanov a 'ecrit :
> > > > > Hello!
> > > > > =

> > > > > This patchset expand the funcionality of the Amlogic
> > > > > crypto driver by adding support for more SoC families:
> > > > > AXG, G12A, G12B, SM1, A1, S4.
> > > > > =

> > > > > Also specify and enable crypto node in device tree
> > > > > for reference Amlogic devices.
> > > > > =

> > > > > Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> > > > > custom tests [1] and tcrypt module.
> > > > > =

> > > > > ---
> > > > > =

> > > > =

> > > > added patchs up to  "drivers: crypto: meson: process more than MAXD=
ESCS descriptors"
> > > =

> > > Including this patch or not?
> > =

> > The crash start with "drivers: crypto: meson: move algs definition and =
cipher API to cipher.c"
> =

> Unfortunately I was unable to reproduce this. I use Khadas Vim1 board
> and my custom tests (https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec1=
40706995e7).
> Tried both build as module and built-in.
> =

> Can you, please, give more information? Maybe your test cases?

My test case is simple, simply load the driver.

The problem is that you moved the algs[i].mc =3D mc after the register of a=
lgs (in drivers: crypto: meson: move algs definition and cipher API to ciph=
er.c)
Test could happen as soon the register is done and so mc is deferenced.

Since you didnt hit the case, I suspect you didnt test the driver as module.

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
