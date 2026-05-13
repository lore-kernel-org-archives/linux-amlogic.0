Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B1CD4F3F
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9e4A73HSnD0b9tzzhWSGXq6+gYf5GuKnRAAC/lqnk8=; b=sSTR8OFaaX9awR
	8k8jM3Si3XN+zrvQwfvNie4l+KY88+UWXQgRK079ymPaM1cy0sWJOUh3zlHXhGiI6rZnnp8tVTnu0
	oqUz9krNQeGs+WSlOxgoBEhZbrtiX4TKSbdX3f3+sLMXEsGGvKzFoZp2z0U6T5COvNBeBbhjzqKY/
	aKQHmhjOOUN6V05yR76jTAyXkuP8GMTxMBcaACr5cn35AGJJ2/56NgPBF24BWh87SFwcIZZoG7vQA
	3DB/YEYSLl2nE3meYNHu+cuqGqC0IyzgKBvTkP/ZNzKnr0Br7WGSOSG+3f2INebp14JV4tvTlp4MP
	rZiFydjADcGjwg3O+C0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pq-00000002VVm-4BAD;
	Wed, 13 May 2026 12:37:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pm-00000002VS1-1aVK
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 12:37:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso37258235e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675824; x=1779280624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OjILpIxhty0m5xDC2n3oCru1zYqs+0xnRTwGa41TTw=;
        b=p6uFXVreZ0QNXgB2aaSoUXOi3q5d9pYTUEtMCvlucrDTuWEJjp+DYneEQGeVJhlDKz
         x7pa1qF7oeabyE8UPLY3yQeXVPv26QqoBFBXRnBIuRYbKvavoatOC1Z7vkDyTOCIf0gM
         o8cxrBGJjtJnckZk0jj0VQXehkEjRCKN3yDyYPXp7Qy/NTRsm1kOm1gXHGOb5Th6hmbe
         rDXOW6smVaDSDBerM4PuGdKrfxT37LxES5T8wO5mB5ZlGFQaZsnl18TDE8LVjXPhDAUw
         NXzAq26dWgzPtlEOvHWUoSXZc1R6AWle5QKP5Tcuuo1utU18uMrkAG9vHX/w5Vbkl9sR
         4PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675824; x=1779280624;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OjILpIxhty0m5xDC2n3oCru1zYqs+0xnRTwGa41TTw=;
        b=LI1g3ontSLRxm2oIDvujIxiathgEsPIJhIJsTdZs3K0LCDtcMV4birKEoU9iNYjnWl
         rtaatd+rZecEfpY7RcPCHgyPZBCQSe8tvnBnOLrTjbwoFE7jj7AoAWgnlm/H6wQw7ezv
         PMVP/FPfTFyqcYMwejbhEKPArpCoULyWqIeW6QwJDHbj492isVqj6K73mAUK4n0tCAc1
         aKJ6FGZ0LCrEVwKq57g1UdsmdcnuUX7W5MzCw9BPRrMGiWemW+3ycHEe/sPdC+7EjL3T
         QB4x8wbmudsd8uh+2tqVRVRZlhGglguyA/dfC7x6AZ9IYqQRcL8ljg++dw/4Sdf5lwZF
         weKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9re/vBVGTWdwVzv2JGdbErlHIV7hXjFxylc6GsG1/htRYr43XSx1P2owJ3WDNcgVN80bhKIdByHSgkf2Av@lists.infradead.org
X-Gm-Message-State: AOJu0YydYxfxoQlLT+8Kbh69ievakgtrCJEeZYQIjStFOaJ4ib+k42fO
	RvIFwxcbPRz/1rMfCkXEjgQrNME1zWvXYeVlvWJtb30BC+1UVFsPZ1xJ3mawhsiwHXw=
X-Gm-Gg: Acq92OECOXzO7Xqi/DDaYRt8K9IR61fYfngqED+cmp2oe58Vef3j1S8iBmLrUWObQEf
	G8jces+93oYlNYU8zWvX+Qlu+ala0ZWv1kKERywgPjg9exovytkDnDpqpVNKi9J7LI91/iiz2sQ
	5ybADBe2SfWadgU/3fvXR6ro7Gr0y08VBJelbk5xixgDeLhCDGz2fF9UtEa6/xHmQIl5LDuqdCz
	F9y2smSuKm9goi4c4RS7TpVTjmpqtWrshaLiKrNSPDmWvDFX90McVk7IDgAmWd+M4Ih08lFhb0D
	MSuMIhPULLbVDty1TNZ6oMDYV/CqI+rCtlxNjMKB/CbIuYiz6yZMDlDvCi3KbnDfjixJxSgdd4q
	mtAnuvAYnH7bG4H7eKAiPZH96hRIvb/8uZYpmzYWJucfL3dlRNbuzyNU6TwXUsIoRppOyHSJSt2
	hH3cuDdud/tllVTYlEHSuFljLnilGJW6P8vCmO3Xnmps80
X-Received: by 2002:a05:600c:5246:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48fce9b5f95mr42872205e9.3.1778675823502;
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
References: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: Remove
 invalid property
Message-Id: <177867582268.1433419.12828948814232574314.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:02 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053706_449990_AAD068C2 
X-CRM114-Status: UNSURE (   9.11  )
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

Hi,

On Mon, 30 Mar 2026 14:11:21 +0200, Ronald Claveau wrote:
> Fix introduced invalid property for Khadas VIM4 sdcard regulator.
> 
> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
      https://git.kernel.org/amlogic/c/6f14ba3c3fa3d67b72e052f431f6776470eb2cbd

These changes has been applied on the intermediate git tree [1].

The v7.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
