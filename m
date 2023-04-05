Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520B6C76188
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Apr 2023 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4mGOjVkev9P4xqzx007qMHK4MSdVBvaY7YdJUldgXQ=; b=XT/aYetaoZaQWi
	kV0TJiPt3sYq3MIgjh0aUPChlfkfQ01nbEHHD5vfDhyJoB4MMN683M68nob/cK1BwOftLbeLBfqu6
	8K9amqPzw/+2fTcnyc88BV8gMvkGSN7i6zvFDuVDwAwpwAZqrFuJA4j0pCy/HWT6Ec8gXWWG0ufCS
	72ZbT0tw2CO+wIOBNhSW6X/a5HuZt8ZHRrZkzIol3+4w6UJe4zY0s9+AJ8rKr0rvaWBIW/vqfB/gd
	4ozmBw2ZjtjHsFBDAvKoLimNF4IdWZZGyyQWxM2fVtJFZlXjGDl2gWi8gEUcLq2d58tmQaDgdipGs
	WdeonLZP9PFS3q31lSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3CL-004XEa-0j;
	Wed, 05 Apr 2023 13:29:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3CH-004XDT-0W;
	Wed, 05 Apr 2023 13:29:12 +0000
Received: from localhost (unknown [213.194.153.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 59A356603187;
	Wed,  5 Apr 2023 14:29:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680701344;
	bh=Wy5cD6MOK2ImneHYyj/DhkXP/o9TxK5UnpSHLobAN2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtqngf0E46w7Qa/GIKf5pYthfkaFg64RH+zZimJ7KFIlqUCO1DRnEsksXA2OhvLw/
	 ZbnWEPugdWSHmOsRYvSMCre4qOUh8m0KtNIziEQ/LUDKcqB8FU+FjfnHAg5kNiEPYF
	 BbpTkDxvQy2HH4ZyXQURcFQnTZwakmsHLFdKcQykWSwb7/GP61/7Aux6Ecr/66O9ij
	 1MCWYzSO+sGdkUwBfDrH1qI8jAid9d3xR8xbat//sNRtegn3KCBWI4UOC+pJuNSWaf
	 lMOSgwJjLul9J2lDyD/0TWbj3bVD7hcdfdkvRHxwgzirmBjrG6/oxxs47wri2dzfl7
	 vxhofdzmUCy5g==
Date: Wed, 5 Apr 2023 15:29:00 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: meson: Fix the UART compatible strings
Message-ID: <20230405132900.ci35xji3xbb3igar@rcn-XPS-13-9305>
Mail-Followup-To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
 <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_062909_348359_C03248F4 
X-CRM114-Status: GOOD (  10.95  )
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

Hi Martin,

On lun 27-12-2021 19:00:24, Martin Blumenstingl wrote:
> The dt-bindings for the UART controller only allow the following values
> for Meson6 SoCs:
> - "amlogic,meson6-uart", "amlogic,meson-ao-uart"
> - "amlogic,meson6-uart"
> 
> Use the correct fallback compatible string "amlogic,meson-ao-uart" for
> AO UART. Drop the "amlogic,meson-uart" compatible string from the EE
> domain UART controllers.

KernelCI detected that this patch introduced a regression in
stable-rc/linux-4.14.y on a meson8b-odroidc1.
After this patch was applied the tests running on this platform don't
show any serial output.

This doesn't happen in other stable branches nor in mainline, but 4.14
hasn't still reached EOL and it'd be good to find a fix.

Here's the bisection report:
https://groups.io/g/kernelci-results/message/40147

KernelCI info:
https://linux.kernelci.org/test/case/id/64234f7761021a30b262f776/

Test log:
https://storage.kernelci.org/stable-rc/linux-4.14.y/v4.14.311-43-g88e481d604e9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.html

Thanks,
Ricardo

#regzbot introduced: 5225e1b87432dcf0d0fc3440824b91d04c1d6cc1
#regzbot title: no serial output in KernelCI tests on meson8b-odroidc1
for stable-4.14

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
