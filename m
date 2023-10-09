Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6430E95A91
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Oct 2023 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6q7MyZL0abKWPUq8cSR97DBQ8GQ/VtnpMibGtvisRE4=; b=KiDQK1C/7RsWta
	2CDScKMO/r6or37m1iE4MDY1hlPqV8Kzth7Oryslmv888H7kkPEFp/2cXqV3zvpFiHLj6yz7+KCOD
	DS8cwmI5+nz7VcuHbuSjuKdHX6Y72jgap+egpaKYUEiIKvpPclW94OufCKw4KRYdcN9K6IPyLGz99
	XHtsg/u5HlJkakMQths86OUlgl6/BhhZq85cq5dW5FMgYkRyrKZBddloieQpKHEYPTMe7pO/3T230
	HZ9UxD7z87cUnw5lq54n80ENhohfpB+HCQ7VXxsNYEM8JXpSI63/7GJIRJyKPENyE71o9aJke0Asv
	C5b5b8Ou9nnptnLCHa8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplx2-00A0dS-18;
	Mon, 09 Oct 2023 08:49:20 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplwz-00A0ck-1A
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Oct 2023 08:49:18 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50308217223so5309876e87.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Oct 2023 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696841355; x=1697446155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+776vboQhTm+2abiwfH74h7cgbYhr3NJObCabRo9sI=;
        b=APyVo5O5WFkyJOwAQHGHyMSz0nk1S8rz6AdH+2K3YzNE2xvjeEARhS61Dsg/21gifE
         FN5i9LolT0b3WMinNwvZspZLBY3rsfGvMzqKC7qvQN177fBa40CDiSVQKaLzJwIEuTtN
         5ID5Rwji6rqisJB4WkMh7EGnr1TMGnc33eRdVUtzFxaw/KuW2mPpapvBIaylg10f9MyC
         l3NTg0iSdr4lVkrM6lcQB/CxPaz+FgFWrditjdQa8IhI3XPjt6rQd0Cq7tpK54Wd7917
         JlddNsVyCznVLvegHvzkcLyZQr2kD8y+3SmXXAtJZ3oA6Kc4CTnTleMuskbimO0AgLmx
         Kylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841355; x=1697446155;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+776vboQhTm+2abiwfH74h7cgbYhr3NJObCabRo9sI=;
        b=qGASVLL2NvAeP3Aua92Ythvknc6lmGedB2/lL5X5vqU/kIQnuo2j9z2BjZIZ0mZYUa
         3D5W5ZZT/WS5AC5ix01x/JL7hFsgVZLJjCrwm9KYO9lWBweY5J2kPi42VOoVREwNsrKN
         EReA+1n6CRerKfjxGfhvLCmWSBD+iKTsegJutJBVm2ZlZG4DDikAcvre4Cse6MriBlUU
         UJoOWiZy1F5bdFUtNE2cKX4V3Xa+ceApf++GpZUE51ARgscz51MzfQ5gvS0Fukp+pSSV
         E0OkAVXWolh5kuclk7K4FIirPB42LvK4Pf7A58b9lmd8RxcNVt/1ZY31T6sLwyhSVCyC
         UX9Q==
X-Gm-Message-State: AOJu0Yzy4IOYQXlIG/RvwlERrXbE02N79MdDiI4xqWvCa0HBXL+Brl0E
	Xw0oIpaUvDfZoqGxkFop2p3CTQ==
X-Google-Smtp-Source: AGHT+IF1hrt67hJyw05Gsu1s8zsE8MHW7O5lYxYtbaMHP87oKAsKaHkU/5xuqXTl2apamOSrnVUIzg==
X-Received: by 2002:ac2:4bcf:0:b0:502:cc8d:f206 with SMTP id o15-20020ac24bcf000000b00502cc8df206mr12621694lfq.23.1696841354936;
        Mon, 09 Oct 2023 01:49:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id j35-20020a05600c1c2300b003fe15ac0934sm6352388wms.1.2023.10.09.01.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 01:49:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231006224644.445295-1-robh@kernel.org>
References: <20231006224644.445295-1-robh@kernel.org>
Subject: Re: [PATCH] firmware: meson: Use device_get_match_data()
Message-Id: <169684135411.1715828.9252611869194225586.b4-ty@linaro.org>
Date: Mon, 09 Oct 2023 10:49:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_014917_405630_7E7BB951 
X-CRM114-Status: UNSURE (   9.95  )
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

On Fri, 06 Oct 2023 17:46:44 -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/drivers)

[1/1] firmware: meson: Use device_get_match_data()
      https://git.kernel.org/amlogic/c/5d59b6a49bb8f6841acf53affc0c4720fe7450e5

These changes has been applied on the intermediate git tree [1].

The v6.7/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
