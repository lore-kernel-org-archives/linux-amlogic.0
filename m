Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3978CDB46E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtlU2J3ngOKSncyLkcHLE64mI3I0o92DBJXdEWCKTB0=; b=aLrgVFPCiocYXr
	y8J+A/xyVJCU7wo0tx8NtZkgF87admFc4fSe2aNojbLr+Ko4g8j25qItRFoBHg/qqgrYnJV2qhQAv
	foJjorkGWDjL4eEni1igoOL24mYQfdA8afXaaZ6OdX940diqCyK6mKEhs7C85/a1fkpmn1dWj/aoV
	7k/h7AHN4oQwB/SU3B+nQXdhVrIWlipk7YQZ5OjVisS7nazVfTtDczDtdayyREHYTNpEQTgEkbRjQ
	0SDwNpioMjZSliJYp9r0Ymt6d9dAKl31UZ5aM+/7kGzbck85BqPvuh4V4XlefIg1kKDNxmfwLHkpx
	aBsmcelCuQ5+3sfPtoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt9I-000gw0-2p;
	Thu, 12 Oct 2023 10:42:36 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt9D-000guK-06
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Oct 2023 10:42:35 +0000
X-KPN-MessageId: 07d0f0e1-68ec-11ee-91e6-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 07d0f0e1-68ec-11ee-91e6-005056994fde;
	Thu, 12 Oct 2023 12:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=xJ2VZjbyRRo/9Xc9+PzqHozw9ZgL0m4qDsRrGQFquIM=;
	b=afU9gTeEjgwKRZdV2qISx9oU6BI6/N4/ud23NoQAPH+8UVZOkVtC/TN06IPksstQK7F+LC+xJVYI2
	 O6RrNgrzF6S91nQJbezf83/fw1SQnj3IQsfB6OgPhl7c8VHHG+rTIZa/GJriZKlEqdm8yXwa57k8Bp
	 EX19ctbLG86IaHBhMFjoJQv7J7zVQtvcTbb/1GFdfHPaHUNj631FjY/i4BOOw8wwyjWF+AKJcGYk/r
	 9CFRjPoUMsVY/coyAKNb5rL8cQ4stRbqInsu6P2R5kXuuP9O/nv9Ma0djrCa+OEpYCuV2DsHw3C13v
	 vntAVbCjy2r28gCfoCFvV8R09fSGCLg==
X-KPN-MID: 33|3aLzn2ZM7BUaBuoHlspM8oOZDFyTq5riljZ1CiqDVCYnzPCR+V1NL8YQZwJMU7y
 MwTFc1IkLaJRPrwCn0vOhd0maKj6Qfkq5J7zgfHB3NF4=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|bhQQ12pbBiL8NqqBsbTz5Zd1i9m1lZqVCs8MlDlVYzWjFXn+wKGL7yFVpnUvtmM
 zXtsD3u9M7Mjj22Cl5Qcwbw==
X-Originating-IP: 173.38.220.40
Received: from [10.47.78.242] (unknown [173.38.220.40])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 07521cae-68ec-11ee-ad2d-005056998788;
	Thu, 12 Oct 2023 12:42:24 +0200 (CEST)
Message-ID: <788e7ae5-1560-4f6f-b6b8-930ce6a9cedb@xs4all.nl>
Date: Thu, 12 Oct 2023 12:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cec: meson: always include meson sub-directory in
 Makefile
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <CGME20231012103531eucas1p1f370bddcb690aa421498e961f4081f2b@eucas1p1.samsung.com>
 <20231012103525.3381314-1-m.szyprowski@samsung.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231012103525.3381314-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_034231_503160_3BA68339 
X-CRM114-Status: GOOD (  12.40  )
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

On 10/12/23 12:35, Marek Szyprowski wrote:
> 'meson' directory contains two separate drivers, so it should be added
> to Makefile compilation hierarchy unconditionally, because otherwise the
> meson-ao-cec-g12a won't be compiled if meson-ao-cec is not selected.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Does this need a Fixes tag?

Regards,

	Hans

> ---
>  drivers/media/cec/platform/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/platform/Makefile b/drivers/media/cec/platform/Makefile
> index 26d2bc778394..a51e98ab4958 100644
> --- a/drivers/media/cec/platform/Makefile
> +++ b/drivers/media/cec/platform/Makefile
> @@ -6,7 +6,7 @@
>  # Please keep it in alphabetic order
>  obj-$(CONFIG_CEC_CROS_EC) += cros-ec/
>  obj-$(CONFIG_CEC_GPIO) += cec-gpio/
> -obj-$(CONFIG_CEC_MESON_AO) += meson/
> +obj-y += meson/
>  obj-$(CONFIG_CEC_SAMSUNG_S5P) += s5p/
>  obj-$(CONFIG_CEC_SECO) += seco/
>  obj-$(CONFIG_CEC_STI) += sti/


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
