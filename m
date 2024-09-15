Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2319DC3ABA0
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbfyjAZoZcOEk5zWrWBI33tuGOBvOrwbxUh96+i1cv0=; b=HxQT/EFLLBUO33
	JiQ/Xgmk5DENkuJdsMNwe9hKyfH6Enwj/gze5R2WvaYB8yksV7ZNk2X8FR0NeBDP5nPcXXiGMDDDA
	HU2yapetW1lD1DVHoRbEuFkZHZOUuR4cqBv+ZEDilSQM9XE4vDNCsOzK3363FwsBinQIYAcfJd7+F
	QHJyWwGInuMKp/h1MdnW8Wr3vqgfRCOubpR9v5aQr+6w5P7WN3nJw6j5GCVgWMrlGu3gsIKQKpcMd
	diMWOoj7BbiObF7tsws38nBuJKGQpN+kaW1h/+vlArYE1wnDLwrxCpBcb4Esn2LCPuQNcOsSUrRCh
	G+aVMfiZDxG4MgDT6Ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spub8-00000002Xmd-0jrc;
	Sun, 15 Sep 2024 19:07:50 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spuZP-00000002XVK-247M;
	Sun, 15 Sep 2024 19:06:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2055f630934so33466145ad.1;
        Sun, 15 Sep 2024 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726427162; x=1727031962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOH05K8gI+IAZvbuBzqlVV1cO+viSa94cBnfzwtz9m4=;
        b=LSbSS2rrMUJaUqdqG+cNIj9Yn0+LifzSNgeOxh9pHk0PN1QOWtsGvLHmyzEDSi+THa
         dtYVWbI9FLidA16qGILuOf3252z7OeKWTi9yfggZEy5l073NQgKfh6TiSeHGnymxPvJO
         5DkyZHGO3cG3M33RYd/0bwFpjCFTbtEGkXTPeaxWguBqEAKl0+QcpdKWWnWB9ujPTq4I
         UMikR9c/P0hD6YOn3/BrT8leuEUVXMAnk2AA9QFcqEVxk4IwYYUJ6nGhAbqMzyjvmJpw
         AezsAv3zeI1FZR+iJ+rtfZdGAgB9OSlqhaCWrPyceiFoteJ5LmEFtC+MQVOCn0+GNPmd
         IzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427162; x=1727031962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOH05K8gI+IAZvbuBzqlVV1cO+viSa94cBnfzwtz9m4=;
        b=ApxdlUvp/x9zz9X/Lma33IKQywM6iRM0Sl3++Ipf8yI47zdBBjkJhfT2nsmLh62dvv
         +Xir36eil7cmETYKZYhSb1Ml15hut5pOgxzu68gKfs1+9U2eEY30ucK4pu01J5uv430T
         6oie707kmOtfKkFdXlT+/ZZBh6Hps0gNd3yD2+vqDkhfSi68WpnizHRQrKCx0KlanVPj
         FpxzRbYZUoFJOFZn5QIAYpp6NeLQiBe7EiRNWtTvaFTf/bHs9kI0l6dY9QcXVgqTblar
         TIyMp2TbvipHSLrhKbS9ABn96Js8inxaeIp2HufvYobRRuszYjngWnqADlZRmlG1ff/E
         TmIw==
X-Forwarded-Encrypted: i=1; AJvYcCUb6LlARJETekXihWjVNonSvpRsQZX7yj+WXtTA+vblfp0wd/NSd3zHEGKONDYrUKVQSSxKUI1zyt70FjjfG5qSnw==@lists.infradead.org, AJvYcCXi+ZSEvG5Y880IUEzvqDdAdm5Wb+TQKZCmoRMJEcDJjjgBO1iHGU9SAPMuAFZyRlRjlFBUs0m2SI439XKC@lists.infradead.org
X-Gm-Message-State: AOJu0YyOzWXxyWxYyw0OpBjofpxOzzep6Drqw7P2O4qdVaOblB/fLNyV
	bQBHFRGaaT/BPZpFLlUhJHFt686vdNIAzDnc6jczH5GsHaaDF5oYPmbduP/z/rz5J6/iQtC6SOR
	fmh3hJ5OE+6hj3qBDvuoF/OHZ75Q=
X-Google-Smtp-Source: AGHT+IFkqcbht/Z9kET9D030mGFZFTW4/RPeXFa22UBotYkviT8dg4bE+MVcepiuEYhDIm2gnxuL8wAP6O7rI/yMaVk=
X-Received: by 2002:a17:902:d509:b0:202:28b1:9f34 with SMTP id
 d9443c01a7336-2076e41cbcamr200524825ad.56.1726427162571; Sun, 15 Sep 2024
 12:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-6-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-6-feaabb45916b@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:05:51 +0200
Message-ID: <CAFBinCB8dhzNExOaO=VrDzTYLHHKUaxHZ49HzAYVnNZhAT_YFw@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: amlogic: fix /memory node name
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_120603_558827_953FCF68 
X-CRM114-Status: UNSURE (   7.42  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCk9uIFdlZCwgU2VwIDExLCAyMDI0IGF0IDEyOjE54oCvUE0gTmVpbCBBcm1zdHJv
bmcKPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgpbLi4uXQo+IC0gICAgICAgbWVt
b3J5IHsKPiArICAgICAgIG1lbW9yeUAwIHsKPiAgICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUg
PSAibWVtb3J5IjsKPiAgICAgICAgICAgICAgICAgcmVnID0gPDB4NDAwMDAwMDAgMHg4MDAwMDAw
MD47Ck9uIHRoZSAzMi1iaXQgU29DcyB3ZSBzcGVjaWZ5IG1lbW9yeSBhdCBhbiAweDQwMDAwMDAw
IG9mZnNldC4KU2hvdWxkbid0IHdlIHVzZSBtZW1vcnlANDAwMDAwMDAgaW4gdGhhdCBjYXNlPwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
