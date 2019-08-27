Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE66C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 23:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D7F2064A
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 23:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qbFe17b2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aKIPYGdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3D7F2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQ3U1xP0KVwOv747hn3+ET04LoSqGrDb2zf9PxQdgfA=; b=qbFe17b2MeM5Uw
	hyzH4GBKobGpVoc0/17UWVGZPXjkfxobaIxCwbYhyJBevVvTrzRtl5ow/kfgTM9BH/0jLuDKWiUYV
	2mgod/zTsB+lmZRROXtStfUkHR7ZlrNEgUoikZ8vbE/DakqBwoBIuo1zXiujGf56a6iZDM4Uc7IGX
	6A19+kYaxC08aeINqbTQuvm6L8TkI/fYJNrMR0OYATIfDerC65uO7J01OrygBq81fJnu7uAYcr6se
	KEPx0Jtfrn5mYO9zkVs0Fyf5Ryf8qxwLzA6oYZoHvVpgQ1rMmQxGrqDryR4YoMYM+UXOsFkc9voRE
	QjEFQDValxNpUyWbEC6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2l71-0001pc-Mz; Tue, 27 Aug 2019 23:42:55 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2l6y-0001ox-DI
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 23:42:54 +0000
Received: by mail-pf1-x441.google.com with SMTP id 196so400569pfz.8
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=zZhupswYJRpQl2nx+3EaAYIvNYHJJK6zS8VHQ2dEq0o=;
 b=aKIPYGdpDtpWjheRueo74FyiXWqdB3rxs9dqEadj9ooeD9wrrjQUXhGqf+pBNgzwRs
 +33Q0tKEOxQcQaIciDay3urxoZZ0LUm7TFkRiRAfERG+2rR1MEoMiyHVb8u+F2qFfgQB
 ERRMV4s4gpt7SyF4cI8pR7aT7vac+5uZ1BJMQMhrrJv1u6anWjbKOGJQtr6zZax0bQCT
 t/m5nv4XRPE05BHeGPgr/pNsl5TncA9GfVE1gIMiW93thDK0UYplitY5eIwCYxE3T39U
 4mv5Uooq96x961Ewdmqr1eo+72Znz4u1POBNBzJitLjUY6f8h+Mqy5JTAhNblnz3/sMC
 NZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zZhupswYJRpQl2nx+3EaAYIvNYHJJK6zS8VHQ2dEq0o=;
 b=jrZc/RlZCLZgAQjTwqwu6uHjpSxtiawF5daNGnXpVkSWDw6VVSPZHX1pAu6BEjI93L
 x7/Gl3yEtTXeUNUBAVbHvNJvRxBtKB0hleMxTJ7RJiCtW9f1QaIflyEu+E2KkUK4pIk6
 Gn1TjAAnNYO2ABHtD1Lls2vFe6s/4xeldL1Ye+gTTBI9X12DjrNHrE2YEnE89ZyG7vds
 ssrbJYiXwXf9jkhvZDVk16kjWZK1C2gXWWGPaDlpGDbk0yVDthhc646DA/Q6mNOhVQar
 +uDz38B6Jb+aKZuZ9SrkR15eLL+7a9gdtyTu4h6kgY9JrNVg/HiDXsPbCkM51RNj76of
 XnHg==
X-Gm-Message-State: APjAAAVroj1xP++8aD5GL06qDH1ZWX6UP75faV+yrvx+0H/L3fLNOJjd
 vMT72T6/hD3qU3dttTcEu3ahCw==
X-Google-Smtp-Source: APXvYqwXfzwRgynraPWYmZHmZ4nqfdc0jVUarkPtMHItZPdLhXyQy/n60WaWTA3gyehqjYkOkVqSTw==
X-Received: by 2002:a17:90a:1a8d:: with SMTP id
 p13mr1342730pjp.15.1566949370220; 
 Tue, 27 Aug 2019 16:42:50 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
 by smtp.gmail.com with ESMTPSA id h195sm468857pfe.20.2019.08.27.16.42.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 16:42:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: add tdm resets
In-Reply-To: <20190820121551.18398-1-jbrunet@baylibre.com>
References: <20190820121551.18398-1-jbrunet@baylibre.com>
Date: Tue, 27 Aug 2019 16:42:49 -0700
Message-ID: <7hh862tbt2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_164252_476479_B8EC7CA5 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the dedicated reset of the tdm formatters which
> have been added on the g12a SoC family. Using these help with the channel
> mapping when the formatter uses more than 1 i2s lane.

Because I forgot^W waited on this, we did the meson-g12a-common split,
so this no longer applies cleanly.  Could you rebase this on current v5.4/dt64
and I'll queue it for v5.4/dt64.

> Kevin, please note that to build, this patchset depends on the new reset
> bindings of the audio clock controller. I've prepared a tag for you [0]
>
> [0]: git://github.com/BayLibre/clk-meson.git - clk-meson-dt-v5.4-2

Thanks for the tag.  This is now included in v5.4/dt64.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
