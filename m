Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33581C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:08:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C9520859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qP362IyU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Md1/iNe3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4C9520859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2s2qxotsymkP2ak1Ms8IBjEy7g34erN6iKwSz2yFhk=; b=qP362IyUMhFZ/t
	MuQLEidmlod2U60BuT/9r0waLh4v8AX37i0f9HD1u7mbXEzCPyaHMlUf2iApJcQmLVVT8UaWiCsH2
	KPbHYqhU+VuX2LbMpPt5LQe1bB62/2sUY3Ti7/uk6s+kXx+pAteHn4ZeeXaClrxFj+3H22vpLSBJM
	EC6+zL+2ydIG5ld4026TvHBfFkE3b/bzIL3Bqt0zoGf9Zlz6z9/BtQ5dEQNf1y/mUa5QKEoo/0FMB
	j8/jokqFFmDLIP+ZBv92qiUrxdmMdYioWDeBMYRegPQFHC9mK1hyn9I3qt2V6PnsuP52vKgG4Fh/E
	ni7vU/E8EF2JfpJX4MLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK2k-0005ug-RY; Mon, 27 May 2019 18:08:18 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK2W-0005WA-5E; Mon, 27 May 2019 18:08:06 +0000
Received: by mail-ot1-x342.google.com with SMTP id l25so15476114otp.8;
 Mon, 27 May 2019 11:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Z8u+Mb6Dq9130guFLmfDlxiV/OSJhxaQytulTManxM=;
 b=Md1/iNe3wpFg7pJRiiTPYACJft0AqPYLSVHS86cINONlNtBMoS6cwZSCdTtBdoIdm3
 565psYs4LGlFtaqtO4X10qXVS+90VoiFiw49WiVbulPp1zyKccOaMC//TjCYszO7YshT
 J8RmIhICklmIIASLuxIvS0m4qoT7WuLRhr7q0jKK/FIO3vRGmiMMNGz9iizEuPlmN7eg
 LnJ7T3YvtS/R7phhUfIOWg1TgkLpecleLlJYMiPQYj63M/cdb1DX7ukZJG1PGDTaZe90
 bXncpZ0Cq3feoQ6jOB7cghvn2/6dEhWqb8hCCMLRNm92CdyXdEew7H5rcIO9HxJBX9Vp
 qyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Z8u+Mb6Dq9130guFLmfDlxiV/OSJhxaQytulTManxM=;
 b=nWXUujcE7WFUM+56BbEFy2q21a4Pj6TlmiynvK+zb3GVpR4bL6T6yLABafo3Ddb6mT
 tJH/qDVZD6BOF/kSwyNmsns8aRf8wFUoaD6C2WjmFaSiDWOIKrhpvGWGAU72vJsYgcWo
 AMxnqTzrOnOHDngZa4OqXGGoAQJRnYw2Y62wQLy0dntVOME/L+8x6SqoJ82OMKLUV33Z
 SzvZu3B2rHAJobf7BRycxDR2KW6XJcOsjzzIhjnzZNKsnc/A72YIp//4FbFUqPmNpCcz
 5cLDHwwC92TyKmttt2yQeR55Ise/GBAEuMsu2hgeLyOdw1n1HEr5A+N8U1DKNQazdvQA
 wgng==
X-Gm-Message-State: APjAAAVPqddWHEkFe8IFTkyUoozymqM/HfnGf3/i2QdOlJV8Sjrpgfqk
 2sYt7zH5/90u0G88wkzTMDVinWNmHO9hSclutDQ=
X-Google-Smtp-Source: APXvYqw1KCJR0ykK+JZRq5RQEXEcYYqCwA42UGA6D3HXVktBN7+YLknn2jRyumOKZM/ijc37rS9VkNSx4uS8BgfiZng=
X-Received: by 2002:a9d:744d:: with SMTP id p13mr50955091otk.96.1558980483396; 
 Mon, 27 May 2019 11:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-11-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-11-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:07:52 +0200
Message-ID: <CAFBinCD-rkB9_LDHAUL3oSD2iSmKHYctUY3_ZYdFNgfh3X4_NA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ARM: mach-meson: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110804_382885_042CDE6E 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:41 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
