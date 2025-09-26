Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36E1CAC5B8
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Sep 2025 19:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRlKxdtAKvg8KPVoBcT3nFmOAFuZEMo97aJE1YVjKaY=; b=y105Zs3EXUqHLb
	tFPuQSXPV1S+mB/1zV+KhmjHySk6xYuRonsYU8SsaFodn8WtlnX2NuRlSbi6QJKcAvTfdNnP8tJsr
	uoJm0JIEYs7sfNvGQeO59uNEOGXw0PwvRH4bNevk0Mjo0zaschs68cTH8aUgxzKYg+V4NKg687jbm
	1nFyHkYi+K4eN96r3bODrRQDc7bOmPWORHRbpA2woxEmFXDmyqC0Rl16wHboDnRatV9Boz+H+XZ3j
	/1tyH2p8y78aHOXHWhSIKnM/hQ3J6Pqgp7E21m88rPDlzpQw/uUQd27IeJdM+BXmDES90i5UhJDgy
	ppLjSYhQysuxk6E6YGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Dy1-00000003tXp-2dQI;
	Fri, 26 Sep 2025 19:18:53 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Dxz-00000003tW6-35iu
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Sep 2025 19:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758914324; x=1759519124; i=markus.elfring@web.de;
	bh=gdbuUQ3HKhlNV3e7D5HS5D3mAUvmuheQjb2LyApEvmw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bAcO81pr1hUloUwKBnpOcFDR1upzv8ju2LVfQyiRIZQVR8M7932QWDsImIVIN9Vg
	 Dr/32NZOUeEBubToMm5dYeY/MqNTjxyXFZkjddW4/v2rGT6wbDWj8ZSmgfYjziVjk
	 XClYJ8XMc64ktgvZZONCSXE4Ati7vf+/2x+0iSwUAUaU+KoiVVtLkWxMnZ+fckaK7
	 0QBDvVfsUxAkuwyUfVAV7ROqaCervfwf/LKn96aPyrbTNf5dzp86MgezHeOb7sIXf
	 dDXq3jQTMsmAfXKcepmNN6nzoJNpCMoiWi3PAvn7ncziNCHdMjLcrcTaOXi9aen1/
	 72bS9HhV8Ukos3Ybag==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.192]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7elj-1uzDgs3dVN-00BcvP; Fri, 26
 Sep 2025 21:18:43 +0200
Message-ID: <4d175e14-dba8-4a7b-8183-828866cc4740@web.de>
Date: Fri, 26 Sep 2025 21:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yu Kuai <yukuai3@huawei.com>
References: <20250926142454.5929-3-johan@kernel.org>
Subject: Re: [PATCH 2/2] soc: amlogic: canvas: simplify lookup error handling
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250926142454.5929-3-johan@kernel.org>
X-Provags-ID: V03:K1:v2rx3tUODy29kKRV0mV3C9Icy6LDFA7cANpvllUoAJBLKjXzTq6
 NxJViGSjHrAQ0s8QzIbWabcCXhPDyBJqZuFPL295Fd/6yDqf293Z+PAQRjEiYTn/fL3SqEq
 RUV6P6SE4xv2p02yRXBxnlyxU65WH+J7iUM4CQijuxlcHDHgp6R9h2WdlO4TsTHshlGY2KW
 aPMqPC8yxsEceZ2bRqiGg==
UI-OutboundReport: notjunk:1;M01:P0:XGuoCYup/Fs=;+KJRW3jQz24wxVu8O2z6hzikvZC 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 EEPe/oBX3c3i1no9Vexd8HA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_121852_077927_0EDAE6BC 
X-CRM114-Status: UNSURE (   2.37  )
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

> Simplify the canvas lookup error handling by dropping the OF node
> reference sooner.

How do you think about to increase the application of scope-based resource management?
https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/of.h#L138

Regards,
Markus

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
