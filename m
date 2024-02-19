Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7061C48260
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTThpbfnd39OqE232oKWWv6HJ/mzMyyzxI88CoFmmZY=; b=J619vxbas+5Dia
	MwCPfW7sZbeTUtIkqCR/8OFH1jwn8CAUEhFGA1gVkt+g8TeXJIAteF2s/oa+A/sC90BcNGPNq4bDM
	VIkkeDS21/DFmZel/KXoErXTErj/KYY9BXrNa6lflpet141AlilSdApi5ggW/nhTXSzRcEMC1+I2j
	q/IJoBW8nTTnZnj13Uoq4nxmMgdY5rBDj0vypVlNlirwAmYERZksMNVWj9hRMGDTH037pU6YLvyby
	o0IyG0jJSgaJ+b/jcXqmCS92xzlmFuZ9jXw6MzX+9eIVMgAIIKESvZaewlW9FAk9Oo8eNEseSFrHy
	mi4mmhh6GdYPU2ZRAeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzMs-00000009fay-0TLR;
	Mon, 19 Feb 2024 08:51:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzMp-00000009fZV-3Le0
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:51:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-512b29f82d1so980055e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708332674; x=1708937474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrPQnhq+uifNDW6L1wLQ8gkUjpW0jaBliebCRq9SQQ4=;
        b=b8JTM1sxe5XiO5aIZ+VGc2xv6VCF5RtSVN+djWT2cH8P35zgjmZo29Zj/uQbzMwcXJ
         tr+dXemX4jSXx2d3/YIV4xu8UjOruvDnAR9FXjgoCDLxWp+GYYLReg8QfbUxsE3IKbBI
         y2GjHUP0pDUvgdB8eRtGJawMx2ASZHxhDh5Lbohn/Iv5cZ2Q14DX+BuNcc/aRO5ympYh
         MkWky1GdFdMWahHr/beuJQmaycwb1VLmw3J5JaiSp2sObcGm1AzjA8z6y2XsMgrXxXND
         MT3PHpG7SmILLFHtif27w+EsuaClpGvxIhyZrfsHPsThfI0BiV15DwH2N3N1AOudqiSe
         VLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332674; x=1708937474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrPQnhq+uifNDW6L1wLQ8gkUjpW0jaBliebCRq9SQQ4=;
        b=XyvK2YgoCkxz6ISOau2jAySilEev0zwaz+j5JdIZCWD1UfLD7iETDxxt4b+R5tuy7U
         oeBclMVDCFe1M4cod3Nw5JVs/KFV8hZeTVoFDlIkfdJs0oqeQTd+Ns2OUpYH9ycT0e9p
         HqLzR/sxnPHafHZuXHzgZm/dWH79jcb9pJ+VOKtJGj+f9/h615QgSVjJTcs+dCMZVkOZ
         1Gk3NxM8OaEv2/Cigiq4qjymkDrG2+SUh2E9Zy/PIDnx4FREdUvW1EwBqGjT35xi8Ph8
         ROdLmvojZRG+ZzL4TtBdT95+CP1Qa8LQOALaH4rAY+gfysDTZgm9vcY9tJFZSPA3JtCj
         sTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa41qi+8n3VOCO38mgW7k4vAt1VBVG2Jt1hu+TsiDiVQGTT2j7gFKY1cHQhusLu1u85lOR+1fO672dSm1BhxUTVEzAMCtyYVI6ibJg9K7F3hc=
X-Gm-Message-State: AOJu0Yxq5DLgkYgHMRG1OQmJxbeljtS1hUIIY21osssoLkZKt+C8sTSr
	gA2iPU6r6Wd2auui8xf5EX1MOt9hmz4hvDD26TCwCI+4iXwAaKsFiI38tfoVa7grSqd6sY10Gwy
	Od+EDGQ==
X-Google-Smtp-Source: AGHT+IEp94VAwIV8UDUHZQ6iK2j8S1+JA1YOJjp/Q1c61r3h7VoeVocWfcqAQMleJ3dGtbsARm1Nsw==
X-Received: by 2002:a05:6512:2150:b0:512:be4c:b53a with SMTP id s16-20020a056512215000b00512be4cb53amr39287lfr.3.1708332673938;
        Mon, 19 Feb 2024 00:51:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c1d8b00b004126a0dfd11sm409187wms.29.2024.02.19.00.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:51:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
References: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1] drm/meson: improve encoder probe / initialization
 error handling
Message-Id: <170833267304.1737509.12815192021500266320.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 09:51:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_005115_878726_1DCBA589 
X-CRM114-Status: UNSURE (   9.42  )
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

On Sun, 18 Feb 2024 18:50:35 +0100, Martin Blumenstingl wrote:
> Rename meson_encoder_{cvbs,dsi,hdmi}_init() to
> meson_encoder_{cvbs,dsi,hdmi}_probe() so it's clear that these functions
> are used at probe time during driver initialization. Also switch all
> error prints inside those functions to use dev_err_probe() for
> consistency.
> 
> This makes the code more straight forward to read and makes the error
> prints within those functions consistent (by logging all -EPROBE_DEFER
> with dev_dbg(), while actual errors are logged with dev_err() and get
> the error value printed).
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: improve encoder probe / initialization error handling
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1a9e51bef89af0f0976cf4c83a1e682895695dcf

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
