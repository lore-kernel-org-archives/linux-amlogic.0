Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E42C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 20:51:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94D4613B1
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 20:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94D4613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UgkC3RDavv1nMPpbZpZif4q1vJqcIKk8WQPUguexI9I=; b=L1yjZX2hmyQlsoHdbQut8zgX+
	8TDjnlFQffEMf+130bWB9Rqur/ciwKTx4+Sem1KyFrmqWkdH77+urbxUl0v7BKj7hR3+OP1fyWON+
	3MF1HV3UTm9o7ZWsOLbWVTlrtMa1HxgnICu8JnbXpUruy+51aaA845T6jy+w5MgnswyTblZks9NOc
	qSp3iJXQXxd7sAk9+ifUfV24j9WT/AgUCeQFP7+8/C60CU9+1I5xfXgCaO3pfci7OjFY1ptlWoYbZ
	DuKdE70Rlt/h0HFPswd8LGljV7DDTpQFhW+y2eFE+s7zglw8OXQv8ofDTeR1uFlb2rTGxXWWwD/p0
	6z0fFmdOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcDci-006WSi-7C; Thu, 29 Apr 2021 20:51:00 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcDcf-006WRC-H2; Thu, 29 Apr 2021 20:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1uxYngYQxqk+PVDP3WJw3Xc00kGb4JNoTKGlf4NQlJc=; b=i6P1inr+af27YeMrNJJXTr/9O9
 57w05pdyPBxhy5Q8H2QzsLCwQqZUnfSFKNQAEWaMirEs4oRwUc5zCdzW6i+d35lSNvtg25virHDtv
 20fDR7fRQo5H+WPly8jmvT6UVfVbgvQVsj9TrgORIraoAVhHCku8ehEsIPAszg6UVQ2h9GMOzfoeI
 uDDugRkWCeYz8HrRBr4JNnv4dDpY+gEt7/16z6xgcaIv4AqFAr5TE2+vsf1uFLNCzu53ZFK7c0Wcm
 7Doasf0eXxncvqbUuX6VeakIjq5tSvNyCBhBapsgNNtKsf+DJvA8UOlB6XP6ExM2pynriQzZqe+fA
 WbEzO1VQ==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcDcT-000y74-0P; Thu, 29 Apr 2021 20:50:46 +0000
Received: by mail-ej1-x62b.google.com with SMTP id w3so101950069ejc.4;
 Thu, 29 Apr 2021 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1uxYngYQxqk+PVDP3WJw3Xc00kGb4JNoTKGlf4NQlJc=;
 b=NjFf6rcAhMZJ3GP8Kb1G1y+aZenxrUqBwabfgT9kgHGhlUE35Z5svXqKB7D1HsLZdq
 4vNZ9y1RAcJ5oSk/jgxWokzecNIGV8ebSCUEZtF51B7VxgxodF273ui10iaT3aFhA12w
 1TPuOI4kc+JyLYRZ1CmWjuH6t+150V7CvpAkJbbpAWPx6VI+mUK+9zv+BzgyQ5hl6L7K
 o8hlMHPcZvR/APjvGsXVTr9dTOCUe+OKBeGt0WoxRHNro9aI+XgHNcJtGeBt5/RlFHtP
 EjASYbSMruZvLJtXIwSCe4AVMBavhyv2RG0l10u50udkJT+Td910zOzpPEsc5FDzxVjT
 3O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uxYngYQxqk+PVDP3WJw3Xc00kGb4JNoTKGlf4NQlJc=;
 b=MVKNueBrobFU8etvMlz9T5ICb6Fx17zI+GOalTmzR59evNSYhO4Ri1EhhFb3jYHy75
 FJy7lOSOcZ636BbrnotOBRzJphZXiMksN/4F5+ZHNU4dVhxjW+5EZ3m+y1GzlKlT9m/2
 PrM2ZbOzGK26n0nCsUY7SsnPTtwDUZT1NTwInvjGjhLmtnN3JzRFt+lsB3VBU9KTIPLf
 +ivAzey6ir11DoSZTQE4JhuipmrbD2NjbH8gd6LKwQIio9ANuAJPJkoda8i7c6zBa6Pl
 lc7bTruVdNzehsrTpeYxL0k61U1R/mXR2CqthZYBxl+Kc1O4EdEOou1DYIvTgsnMK0Wq
 Mtaw==
X-Gm-Message-State: AOAM530RaYcMvd9GgeFdJ90Jj291XiuDvOnhDGkb9/db7GZDtBFG19up
 fOXekzNoOZhT5lwbYBgfdyW9dWy+tzRmKo1ffZFmcd4N8N4=
X-Google-Smtp-Source: ABdhPJysjlV6wcuLfYd06FMw2pBaznePZVcE1hTvCj8elYYMmCQAATV5o2uqzLuxQYLtP0GSZtEYWBLOTySqdAlfFco=
X-Received: by 2002:a17:906:85c1:: with SMTP id
 i1mr454865ejy.216.1619729442540; 
 Thu, 29 Apr 2021 13:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210429170404.3616111-1-narmstrong@baylibre.com>
 <20210429170404.3616111-3-narmstrong@baylibre.com>
In-Reply-To: <20210429170404.3616111-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 29 Apr 2021 22:50:31 +0200
Message-ID: <CAFBinCBJvW2i2P98d_0d-ZJq2=Koh4vaQXUW=Sb94mEq_KWt2g@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: amlogic: add Banana PI M5 bindings
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_135045_072544_DCE38B03 
X-CRM114-Status: UNSURE (   7.03  )
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

On Thu, Apr 29, 2021 at 7:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add bindings for the Banana PI M5 board.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
