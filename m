Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8A2C36002
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Mar 2025 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq/nZLwWoSboxj6xhKfsdx5n62ffauOx9GQk5W4vpv8=; b=uoxMR7ZYH0Hrj5
	d6cDUdJehbIZj517Kys2DSszXr8uvchDFm34un8oxDeKf4IPmF96exD1aywTpwVfJdVvojNIm/VJm
	5H52d33hhOto1dd8e/rpRHeJLJ5fzd7heguSKxwtIKmW+24ISv4IjUpp0kbjbyqSWFoqmqcC/xUs0
	F6bbIMZwOtIhNFDJyk9tfJeTaD1tGqZ+4neF0NJDd5w0vG4RLQCPRNZZLZrLsBuKCk+4jOxiCdLJY
	1uxxyG9jsBdEPnEOFFsXF9fVyfU75scdOg77dkQxMqxJfL+ikwP2ryUQlKQTTOTdp2TNdYghOrZoW
	Iv33kD3cCrmkMP1zB1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZmr-0000000EYGG-3RQQ;
	Fri, 21 Mar 2025 10:39:37 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZai-0000000EWLL-3s0f
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Mar 2025 10:27:07 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c081915cf3so241669085a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Mar 2025 03:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1742552823; x=1743157623; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C6XBFDQAIe6jgF6F40xRB15uQkrbHzlxj9SySg4AP08=;
        b=LmNfEBZZml1EDYYkD0nWv72zHMf49uMTytRkxAVxsm27xEadylgYHZy/3AivwuscFY
         IEbKRWTKqPcSHUdnHRUPNGQuLPxA3mELcnV3ZMSjpMKKX85hzF/dpFwkFlfd79FBgN41
         9MX+kYT2KGA2iVSgB5Ogn7wkkAoEidsKzjMnVmTs3yDR/7ACTRtkKEu2AcR2gxQUSNQS
         6juEvxgpOyRN6dZENP5Rt17a/F7LFwKJMOkmGLm57/8twHdwgG+Rhxwzi+hZqLMmwy4u
         i1QUQFboZ70HOOCv3OP9Pd1WHmY+CTPF+U+6htpt2rizcPbNEXHYwaejyvUqkdIs7kBr
         myPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742552823; x=1743157623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6XBFDQAIe6jgF6F40xRB15uQkrbHzlxj9SySg4AP08=;
        b=im78eMMSkAcTk71IauKhzaLz+F9EWPRubTdhDWQum65ZAfJfu1jjQhtbWw6h/+l/up
         vNdF+fF9htk1sk4Mt4mvBqlyIPzOfOqzZfpivfTI+nzxc050LRo50/JGM9GdWlCXwTQw
         OKFEQaGUW/EnsbKTeTQg0kfpqKF+eSCbGSa00TGDAccw1YH1d1C/IaX97eSiRo5J2GjP
         IJKSkdzC//C5DMaaForSKFKPZO3mTV8mj/T6I5NEg096NlIoge5jV6QfJ2KEKVJFQYFQ
         MBOShy3vpep3i/VqWJqFGZdeewPzDXV41GE49Iu832o/4skAeGBpqk5r7X5sWmW4s215
         N/9g==
X-Forwarded-Encrypted: i=1; AJvYcCVMFuli9WjQ+rrXKOfde06V4kbTxR583Y16P6Kv5YVwNF2ENehfiYZf8xit1qf8M0FH9y2LZmUEMl06SGco@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt8u8O2uCbslX/JOQZIV5HIwUzby0lejFAG3GAl4yS6nk5vLOd
	MadH9uiVQI1riLz6jYMxjxzmiPWmxN77f9wcLRiKzrSthjjAnTHTr4WiPImXIOH9wkiMyT1Qtwa
	zTSBzqC5tswbEgE6ZwZXVVSSAjfzKX5xhFR6Xtw==
X-Gm-Gg: ASbGncsKpVmKAh6LXII8hWp3SCc4HPtTq8sPqODa2pyDvcoHwZAWThNn10sZdXbbJLD
	Buj7DWjULHv4BonQCtsXYs+Asg1gykdwvwbECkSI1uHcGgaLJtlSLafGQ4a0Wa3cukklBCf4z8C
	O/oJ9boO8rK9MMX0EFaVGDh/wX
X-Google-Smtp-Source: AGHT+IGtKZxKAoZgtR0aBlIVmyFJdz4vLgELnLl5z6u4LuYLjXNoyuq0UVrTF+CIIc7xPDTVRmAHZ+SRVPvG/7TyZXI=
X-Received: by 2002:a05:620a:4055:b0:7c5:a423:f5b0 with SMTP id
 af79cd13be357-7c5ba13361dmr406693385a.7.1742552823192; Fri, 21 Mar 2025
 03:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com> <20250314085858.39328-2-vignesh.raman@collabora.com>
In-Reply-To: <20250314085858.39328-2-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 Mar 2025 10:26:52 +0000
X-Gm-Features: AQ5f1JpymW7UP78_0g_Z-sNByprYGBFX-xYqr_OlbVrsK0-Hob7Zk88vIu6Znbc
Message-ID: <CAPj87rMjF84yyPqBshuGu=8qx6Xhq9Z-HgEnQe=tRtbu3E8OtQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
	jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_032705_136002_8E6E3E8B 
X-CRM114-Status: UNSURE (   6.60  )
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

Hi Vignesh,

On Fri, 14 Mar 2025 at 08:59, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> LAVA was recently patched [1] with a fix on how parameters are parsed in
> `lava-test-case`, so we don't need to repeat quotes to send the
> arguments properly to it. Uprev mesa to fix this issue.

Thanks a lot; the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
