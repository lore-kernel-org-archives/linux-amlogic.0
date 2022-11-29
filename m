Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E52BC4321E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41FfBoTuPEzxeJL9v07OpHy5oJcU3ZoWOPq6n462bYI=; b=JLQEO3RGIfxVVo
	reefUFfsp1zhaMKLES8n2i9K74+yq2DPxXAK5xIgimWieXt6HYWxo6OC8UE0T1EfVEJVksNgUjbfp
	Sj+EovW6cgOFAbVtWsIh3IEBPqdQMpdl8B9+UE7/INLDNo1L7jHNg7N4ONYoKoj+pZh/S/Ix8PMnS
	6bxqxJNDGy63AVizqqcUW59sZlc3QhGvGTi6eeryAOP5JCAnCKBADTnueKG/bymh2lpDFuu0Ch8mi
	/uAGrHw5ptePEGTSmjzqZEXN8W1U8kHc93b754pHAnwUiU3EZ/7ARe8AR6lk6iLzWV/CTdMplEjpI
	WkkR507sE1I8Ibp5fcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Os-00997j-Pu; Tue, 29 Nov 2022 14:15:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Op-00995I-7w; Tue, 29 Nov 2022 14:15:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 455606175D;
	Tue, 29 Nov 2022 14:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EB0C433C1;
	Tue, 29 Nov 2022 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669731349;
	bh=1Oc1MVNAtRZeQuc9t0Z8LwlpFV6Pi0TLMkaqJz6t2kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMB4M/py92/8FkmD0CoKLY0VPImxf4GtkrHqrR6KKOPRPJ2e79qdg3tAmEXM5zEyZ
	 8n8riM/VEd3nk8EuBJExTEraq+N2fxX8FEX3UR+QxZRbMQbMIzgESMjbLCYotHEI4Z
	 uyi2i335dNYH+tYNhDvi1sq9Fh9s7MvKWtFWQylBd7oImzLrwug0w4TO4iLb90EUsC
	 9uBn6m+VDTBPjz57s1k4z4CR5DKoKHzjv2GC/Ag6ufxPm4PTKleInMv8Cu3+jW0GMl
	 pmKR5rr+eTg5tr+QXm7wKvzslU4ePnHaVJRt7JfsxkUA/ytK1MbyxaCYfs3v6kOxMw
	 B9nnua19f019w==
Date: Tue, 29 Nov 2022 14:15:43 +0000
From: Will Deacon <will@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: jiucheng.xu@amlogic.com, mark.rutland@arm.com,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH 2/2] perf/amlogic: Remove unused including
 <linux/version.h>
Message-ID: <20221129141542.GB26437@willie-the-truck>
References: <20221129032108.119661-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129032108.119661-1-jiapeng.chong@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_061551_342413_13DF17AC 
X-CRM114-Status: GOOD (  11.22  )
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

On Tue, Nov 29, 2022 at 11:21:07AM +0800, Jiapeng Chong wrote:
> ./drivers/perf/amlogic/meson_ddr_pmu_core.c: 19 linux/version.h not needed.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3282
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/perf/amlogic/meson_ddr_pmu_core.c | 1 -
>  1 file changed, 1 deletion(-)


I'll squash these two patches together and bulk up the commit message a
bit. Thanks.

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
