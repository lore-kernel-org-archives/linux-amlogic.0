Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83A0C53219
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbUzW9HPQ8Yk+4fY/FwBXFeLo1tMkfV0j5N2AsKo9so=; b=YtxYciAVQBRepMbTEuAR98lF3s
	N9Aq4wsnx/v2Quu8mjv5stdw7kssMl9C3szQOtESnjuDGVqTFV8fS9iCaqknExyaAQCdmfTTWwlXu
	X0JbOhnVQJMjXunjU3QVv2VY3aCB+AAoNngy48kJA3FCGf7t0LywfJedjtsX0PVIm4EGlVTLbjEe7
	NIM2Z6ayAy+k3ugRoC8SbZHGtxJAvODZM5xeQlpkqQZwV1Jpy7y0agEtlO0JABOKGatZEtL3Xwru0
	ornH3EVqHIehr6ewbmLld3eSnx+QXm2F4jnHF2FKGt46u+CATMjCy74d2a3mN7tLFX7QwQYiuK8sb
	AyaxJtiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Bf-00000008Yg5-0E68;
	Wed, 29 Jul 2026 16:31:19 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Bc-00000008Yec-1WnE
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 16:31:17 +0000
Date: Wed, 29 Jul 2026 16:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1785342668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/CH1RQ51wDKB1nw1PqJ4AnZY65vJPiP0L6rpa3Xr34=;
	b=RlhoJ0IOQVoLpDQtytQO8MTjIYvJpV3c/0Zq3gYTRqDiCpNDZmC8ob6kOYX3z7VfxM3Ivs
	1is//wB95LM4LTyrvKkj4de4HjIwlR38130ajWnOSPkmPJhLTvXIv9nytRZgNcPDeshIs+
	uRMOpQ04SZPdTnp06C+fkrbKpBuMHMC+qIEDCRyC2uiYV0kWN77rCAOGPJsk9gZjRKZvbu
	r6QGk2IIcYtHhsmY0sUq2zxJ/hDf3wFAZK9IZHQnhq68dJgUXfR87uIoQ3qhTtVv6zXtnf
	7s7CjvtQ2qwu/S8l3/mfJkp4vTI/bH9ye7bPEL6GlhJ+fl9wqXnzCVN1It6o1Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Alberto Robazza <robazza.alberto@proton.me>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Orbbec
References: <20260729141234.65037-1-robazzalberto@gmail.com> <20260729141234.65037-2-robazzalberto@gmail.com>
In-Reply-To: <20260729141234.65037-2-robazzalberto@gmail.com>
Message-ID: <tiy37g.1ypi45yn8qibx@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_093116_544620_47E4D1E8 
X-CRM114-Status: GOOD (  10.63  )
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

Hi Alberto,

On Wed, 29 Jul 2026 14:12, Alberto Robazza <robazzalberto@gmail.com> wrote:
>Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
>3D depth cameras and embedded vision boards.
>
>Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
>---
> Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> 1 file changed, 2 insertions(+)
>

You seem to have missed Krzysztof's Acked-by tag in this patch:
https://lore.kernel.org/all/20260729-unbreakable-observant-clam-ca4f6d@quoll/

Reviewers will typically give out Acked-by or Reviewed-by tags to your
patch to signal that the patch looks good to them (typically the former tag)
or that they have reviewed it in great detail and approve it (typically the
latter tag). These tags need to be picked up and added to your patch.

If you use b4 to send the patches, you can run `b4 trailers -u` each
time before sending a new patchset revision to the mailing list to get
all Acked-by and Reviewed-by tags reviewers will give to your patch.
If you don't use b4, you should be able to add them manually still with
git commands.

If you don't have them added to your patch, it may sound like you
ignored their review. Reviewing takes effort and is time-consuming,
so always make sure you have all of them added.

Also see: https://docs.kernel.org/process/submitting-patches.html

Best regards,
Ferass

>diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>index 396044f36..a42899bd2 100644
>--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>@@ -1251,6 +1251,8 @@ patternProperties:
>     description: Option NV
>   "^oranth,.*":
>     description: Shenzhen Oranth Technology Co., Ltd.
>+  "^orbbec,.*":
>+    description: Orbbec Inc.
>   "^ORCL,.*":
>     description: Oracle Corporation
>   "^orisetech,.*":
>-- 
>2.55.0
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
