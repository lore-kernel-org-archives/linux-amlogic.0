Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C07C7618D
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwaMjFdBLECqWgBUAM3371e4YZL9fwBNUrMkvgoAjMQ=; b=vlQXZz6zv/Nu7oECZLgNF6hEzc
	ColYPJG0mfGSflv1fPKU70OKy5Fft0nd4efTirLDpmqPKY5W5ssxs376vHDCxxf1lJ+tZlu9EVJZw
	jcOQ6u6MTJ1jxP3hMI5hbOpz0yDsyq8VrKXgZS/Zk1v4h4uaWHULm6qqjuk4y10803GenvPcXMAxE
	8W+bOS1AsDHL5sxUM9I1VFO9cXZwBOUVQ/2GCEscgMlNaMPIQtObcviTE+z3ZoW00jsECEgSdzyHY
	wdI2lNW1p+jGRtnirv+DrMzpWgQ/f1UFGwdr04t0b7rQ0cW8MeBN3Q2qs74cEUmRHrvvDstB8hBqT
	LpKGQQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKyR-006kkN-01;
	Thu, 06 Apr 2023 08:28:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKyM-006kj0-1j;
	Thu, 06 Apr 2023 08:28:01 +0000
Received: from [192.168.1.137] (unknown [213.194.153.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DA0E466031BB;
	Thu,  6 Apr 2023 09:27:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680769677;
	bh=1nBklH4kyqbA31Jsg1oOEp2EERFF+Vrfj/F3mYi+aao=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SruWHcSsbj2C2KnJCzfZlaR0GuuxfeXygXfWBpd9MBjiOmLtj6I620IIvivr6uaII
	 gMvxevXHYgyOWJsWq4jV7/Khiu1LlbCpgQzY79qtHaPOtaT7AeEOgjMXwEaSdlY6Gy
	 1/cmH67DUFfbzERz3UWOAmuVN4N9GbxHIob+e1VCujylS3HQPOFRFR+Pqxtz+Wq6vc
	 +FxYWsdvJC+/IXVt6qnHqmwArtciCpZ0aGaBmZLNlo9qA/pnDo8tIcwcIwSthWtWVJ
	 qw91F2H8rvzbFaYDJbZP18MpM3mqQOonkFtPLLoSy7EsEbFpIi9kMRkIhrm149MNPN
	 mAUdKmf4qpfpw==
Message-ID: <44556911-e56e-6171-07dd-05cc0e30c732@collabora.com>
Date: Thu, 6 Apr 2023 10:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] ARM: dts: meson: Fix the UART compatible strings
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
 <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
 <20230405132900.ci35xji3xbb3igar@rcn-XPS-13-9305>
 <fdffc009-47cf-e88d-5b9e-d6301f7f73f2@leemhuis.info>
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <fdffc009-47cf-e88d-5b9e-d6301f7f73f2@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_012758_704946_A3C0130C 
X-CRM114-Status: GOOD (  10.81  )
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

Hi,

On 5/4/23 19:14, Thorsten Leemhuis wrote:
> Wait, what? A patch (5225e1b87432 ("ARM: dts: meson: Fix the UART
> compatible strings")) that was merged for v5.17-rc4 and is not in the
> list of patches that were in 4.14.312-rc1
> (https://lore.kernel.org/all/20230403140351.636471867@linuxfoundation.org/
> ) is meant to suddenly cause this? How is this possible? Am I totally on
> the wrong track here and misunderstanding something, or is this a
> bisection that went horribly sideways?

I didn't say this was introduced in 4.14.312-rc1, this has been failing
for a long time and it was merged for 4.14.267: https://lwn.net/Articles/884977/

Sorry I wasn't clear before.

Regards,
Ricardo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
