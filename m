Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD7AC47082
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:11:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2162960FE7
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2162960FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ThFEs4F+8n28JSSHdEwqNKR1MReniQ1ZhSdblRUgHU=; b=Wc4unbWsSPfxVy
	TmJu77FmDYuoTtUtZ8Cwx2vOFyD9MVDodWDt2Jj35AkIQcmC3KYQ+QJiDqwPlo7DGNqPvhj9t8txW
	ermpy+6UEFSiMpen0Bl8eB0I7lOjsGFgCDgPqAIHE5mfdv/C4MCJ26VDqX8AmRnEPqSBnzA2xOa4A
	H1HrFgn2RWM0D+zNvFPVC0/1IBbhaGRQAC5DFk+V9BBczZ2b6gJVGaJY+Yt6+tD4VEJBl9+h1JmVF
	V0hd8RWG7ALwFLSXPAqgxeabexIT1zQvPXSvD/LDEppWxtd+fJDZRskI8UUYIQvwbccr+3hBsvztK
	h2MVovdkk4mNlsS7G4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loroP-00A4Xu-Qi; Thu, 03 Jun 2021 18:11:21 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loroM-00A4VW-Bg; Thu, 03 Jun 2021 18:11:19 +0000
Received: by mail-ed1-f49.google.com with SMTP id u24so8139389edy.11;
 Thu, 03 Jun 2021 11:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6RALmKD2yVq/FoZ/OILeCcvSzeQF2hgf1qHU4lzCbE=;
 b=E4ABkttKaL1zsTSMippEd6bDMVq124HB0LTZVlj/e6B2N8V08roGJpo7/dkPP8FIhj
 gc/JZtNWDMbgnC4xZ5gnYz5Xd56uTnxBIaQsNXGaUNIwRVV15hE2CqsgUh2Fi7pvb87l
 R8WlUFPGT2uajzRXo5Yi22zgZZJSOqeyVJVnDqjlxb68Fi5rrR5j01gnkZ0v7iMKxSdW
 c7AyJU2uN/RgekcGswX/XBsFTLeVICwhedhjSsAUIa4hG/MwEF3O0p+jH0n9D43kMdPj
 Lf8/80lFIZbjrK3Y/uJjazoyZz/xxsiN8QWiNYCVZMAre5zWz7cMdR2bMxiwQA4MHMGc
 Oj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6RALmKD2yVq/FoZ/OILeCcvSzeQF2hgf1qHU4lzCbE=;
 b=iiE/7qpvJNa6FXXcvNNzjWRngBFyj5O/61QQ9u0g4seHcs7/RpFeNx5yZhCiNnHMt1
 qiuDpLgYBDVOxWKIDWCoJv6McNwJbE0qdjSyoq+AL6xR0es1Spz7v6Iz1eLLNT5ERcDd
 z3YJgOzSQ5IUSpxlrfiXLy93pmZF1q1iehdyK1y7Ix55InsEuUQTMVoqFemiTgi7v0tZ
 RkJobm0F0xYj6z8Ju0AhOtsDk++jjd5xwxgaLEAVIxeJ4UpuOS23ljdH6Uxj3ylmjjB0
 v4hovT9MjISjntxOU3R95UAAD9FzHNTp6g76dSsafUExrRg1VbFTggKi5Cx5W6ivb43h
 +l6w==
X-Gm-Message-State: AOAM530V0hQ83ZBou8WJB2L4bqZtwxnXs5Gp2SDbf8404eC/N6Vmu3xJ
 rqXZIVXtKyk3TWr3q75piXMIDCgfu8NxWFpbOBk=
X-Google-Smtp-Source: ABdhPJyOJotBoCgnipCoMvpMsGKOTPoCHAuAMEmpd7uRsodtC0oGXEqdnoSe0q1hTkfzMH55eCzP2DPLpZ5L4LLpypY=
X-Received: by 2002:a50:9346:: with SMTP id n6mr695165eda.365.1622743816608;
 Thu, 03 Jun 2021 11:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-7-narmstrong@baylibre.com>
In-Reply-To: <20210601090140.261768-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 3 Jun 2021 20:10:05 +0200
Message-ID: <CAFBinCDsqbg33adF5Xkn70xDmfM_rFdwwAoe7X_exw7_KnPbvw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: meson-sm1-odroid-hc4: add spifc node to
 ODROID-HC4
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com, 
 Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_111118_454317_B5BF971D 
X-CRM114-Status: UNSURE (   9.70  )
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

On Tue, Jun 1, 2021 at 11:01 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Christian Hewitt <christianshewitt@gmail.com>
>
> Add a node for the XT25F128B SPI-NOR flash to make it accessible
> from Linux.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
