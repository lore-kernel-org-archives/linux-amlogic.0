Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C567C76196
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWwoSIHjQSGhbkCog5/ppctaUwYatCdBRp95mhxUJeU=; b=JRjyi3t7vk93Bj
	XXyJblZYOtrMvHjyOZyiXfmpDN/LjlrTQk1VCYtNW2p1+P8vWHDNQdmthoybwfFQaL8QEVrNuRmrz
	RHBTIJpxM+lJ3ml/gEM+ZJoKT5b9q7ZERCQM26xxzpv1hW0SU/Fdl4eFPvGEAN+5S7x0ddmJbsn2x
	RYI34seYS47QfL+4IXcodcIrtDey9df/jPq9WZ5OxLUkqlQUJ2XX8vkP7lHwTZXc8YalRX2kX7Osx
	Fqf6vs677VEDxu2Ta2o9fie5wj9bOzqjFyMS2L+428mK5+KvXMNSJ4JFBrTEbmKFgT5p5T8MDS3aj
	+awJnO7xwhQWDZQongHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plkj8-00EdxP-0H;
	Mon, 10 Apr 2023 06:10:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plkj5-00EdwQ-1Y;
	Mon, 10 Apr 2023 06:10:04 +0000
Received: from [192.168.1.137] (unknown [213.194.153.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 666FF660309E;
	Mon, 10 Apr 2023 07:09:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681106998;
	bh=gQDFXrltfn8fBDBD7wVmDCBTJ72VJgdVNsz7Tyqy0cc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I8C2BoHT9Bxw1Mf6KC34w6Xr2lhYHI0RwLIoa/jASH03TTf6Q9JSnRCoXiAB88zyV
	 VnEneLp6pkaUQtfOvmYY3HzpReXL5wEC6Mk33Rpse67KpGqXb7PlVx+Hsrjh14rFhH
	 vUew0JKTmngCtccbURi2E4S5iYxkN3mOnS7AZSX7SE72l7BtOzDBzG6B0DMAySTEnf
	 S3yGEbH9zdpTeCJuasQdcBhc0hVR/QCuutDKCtHRrakr3fgRer2F834MYDq4HaXkbZ
	 u/trYN/8xycx5fNzsLns3Qe17utSkoxgO+AfVWdVg2N+CU9Sn8QDJ1tuqxG1N9dBKr
	 38mXcoe7vZNOQ==
Message-ID: <d7f389ab-914b-c48e-dc8e-290fb72f345e@collabora.com>
Date: Mon, 10 Apr 2023 08:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] ARM: dts: meson: Fix the UART compatible strings
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
 <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
 <20230405132900.ci35xji3xbb3igar@rcn-XPS-13-9305>
 <fdffc009-47cf-e88d-5b9e-d6301f7f73f2@leemhuis.info>
 <44556911-e56e-6171-07dd-05cc0e30c732@collabora.com>
 <71816e38-f919-11a4-1ac9-71416b54b243@leemhuis.info>
 <2023040604-washtub-undivided-5763@gregkh>
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <2023040604-washtub-undivided-5763@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_231003_672381_74A31288 
X-CRM114-Status: UNSURE (   7.35  )
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

Thanks Thorsten and Greg,

I sent the original report to stable@vger.kernel.org. Sorry for
the confusion, I'm still learning about how report regressions
properly using regzbot, specially for stable branches. Thorsten's
guidelines are being very helpful here.

Cheers,
Ricardo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
