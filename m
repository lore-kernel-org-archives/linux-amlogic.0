Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D05D65C72
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rShwi9VQxDKgoPClgUXIDtwHFjm1xsijIv2uNNkJ/Bc=; b=LInx5qxv5IB0Rc
	82l7JJfME4pU/Fk1C645/iVqc1mpz1Pn3yabgEDsqU98FhUy7Xvtaq2TXK7JvOVign7eDxFd9z6C0
	HgfLWg2ndU4fKQysocRBVPxgC5yevPzjWkFRgl5Gv597Vuv3EQtnQKd6Y1nwK9vcYMkOU7t5etta3
	fQjULjBp1B+NwzUfUZRdjnLRTOmHZX/YaBhLAAjwIWyXi8RNeBxTfnnb0O8cSxyiOMbrSM7SFyYaB
	9de1nrs7OCgEQn5jOKnmNQF2utqGQhh/f7yb3rN4tiVftZtWmANq2EDOzoZskUYOc/6naPfaP6SWg
	/s99E3HuBJNKKFkqvI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVto9-000000072Tg-3Ybt;
	Wed, 17 Dec 2025 15:51:21 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVto7-000000072Sm-3gW0
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Dec 2025 15:51:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0d52768ccso45074725ad.1
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Dec 2025 07:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765986679; x=1766591479; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaQln5KFChsYDlbyGz32xYd/pKZvVrs4NRGdlUfoF8E=;
        b=mMKWhWOMLEM921tXbdSdEh6jeGjKuw13y3r2lbwDhzCJrz40LBUkiezgt29TxogFJO
         Qu8IJf5dw/A8LVLQV2pE9FhCtamcg4nE24HPHVjVfirKe0b2OyWLuZdT66m6ti9j1Im7
         WJT9chUK30MUL63vH33rEsWo0/mJ5xJwQzKpgDluTtNbAeblJ5ADq207h49JEqCQQUvL
         /57SsrH0dk+6dcHRlQW0w0iM7lDwf4CG8actOA9CmrKrl36FmmXOYZgEp+FTJaz92bG5
         c5+JO+xbkAPD8teuJ7da8lciHRQhyCVr2onR2MdgzoV6Bu3DOLk7GxRW5ewWu/3CcDcB
         6zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986679; x=1766591479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UaQln5KFChsYDlbyGz32xYd/pKZvVrs4NRGdlUfoF8E=;
        b=xDfYut6tohg+1IbX9LF0FMM+iVJ1vZh0He5rXxZjWhkzbHW7cWsyehTwHXQmHC5YkC
         vTiBU3RwSeW1RuPLEjgUGof1J2WxRtBtjECQ6FhzRqBEjjYW0d1mygb2pENJWMMt2d+0
         VnxU9V8h9Ryf+GITp93QbsbflDMi1J75i/ad/YzpgyZKkPF4vnriCxLpcpPmqazmt6j7
         Jjmgyg+iq1cVXreEz7wWknqPDIkDcjdYYYlppf6bQQZWGkcJkYIEtrqPC0mWRy+Z4H4M
         fXKIjxegpSaICdjb+g9SN9YP4JbyyBLI86uO4/+pB3vfMikVIpVYEIGyEkKi6z8/sHEp
         2Y1g==
X-Forwarded-Encrypted: i=1; AJvYcCX6RmpdtAItbwRuRnrVTEx6mPRhcVVnGdBPSCUzfQg/xna5HEYKKHLLEJc5i8mNjOftFI9RJwyuMt+WkZAR@lists.infradead.org
X-Gm-Message-State: AOJu0YxLpxX4omWpkoj/ByMlsxCGUVqEIKK/NkIPonEBMnry+It4Nkp9
	S7n5Ova7XRSO20B8PS74muX9YXZP/icQfXQ3/wPJSVZihGVQ7lzYUab5WtRgoUs3U9/kHxXM0Mb
	YMRZnrnZdBd4wxwpPnxS61L4MzRLYyxE=
X-Gm-Gg: AY/fxX6bgO/MEqpJiggI4EWeY3+GiSLC2RSaxaLxi9NBg/B5iwQWqBFo0bc1MdOz5no
	ib782mjhSg0zqgNwMTGxeY1/I5bDStgQIg4UiI0dChgsQM6/EMY5vYgo2C2Y4sLogOXMeMKalcx
	KTUytxfwdwm2r+/SeCnjhK6pTQcdNMvwdDP+x6g7QQiVCOmCbnikluuSF/rd6pC9Jf46RvobKIr
	8L0wGxUK6uF8a9KjE+z5ceZwNoM0ZLUPb0Ujwi7X49cu9XB4sjgr/w9hmS0tcPmjBinViahcSXj
	DbnvT8SvgGaW
X-Google-Smtp-Source: AGHT+IG18aJElwDN7YRoQnIcAwDG0065E0+p1N7BsBoJnGjywb6Nug0W+C/xZ5Tt8D+SSlmv4DAlXZUSoIL+EflnzPA=
X-Received: by 2002:a17:903:41c2:b0:2a0:9923:6954 with SMTP id
 d9443c01a7336-2a099236ad5mr145593875ad.27.1765986678903; Wed, 17 Dec 2025
 07:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com> <20251127-reset-s6-s7-s7d-v1-2-879099ad90d3@amlogic.com>
In-Reply-To: <20251127-reset-s6-s7-s7d-v1-2-879099ad90d3@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 16:51:07 +0100
X-Gm-Features: AQt7F2p7Wlo1bqa7Hg62xU3xs1iBlgAI4mGSUgZiNcPZaNc3prffLkE7u9Mu5-Q
Message-ID: <CAFBinCA19ws1OmfZLh+OSmiEuvY4owOKyzFpaz5KO6E8HaKmmg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: amlogic: Add S6 Reset Controller
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_075119_908498_F09063D2 
X-CRM114-Status: UNSURE (   6.63  )
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

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgODozMOKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgpb
Li4uXQo+ICsjZGVmaW5lIFJFU0VUX0JSR19NQUlMX0RNQ19QSVBFTCAgICAgICAxNjcKT24gdGhl
IFM3IFNvQyB0aGlzIHJlc2V0IGxpbmUgaXMgY2FsbGVkIFJFU0VUX0JSR19NQUxJX1BJUEwwOgot
IGlzIE1BSUwgPD4gTUFMSSBhIHR5cG8gKHNlZW1zIGxpa2UgaXQgc2hvdWxkIGJlIE1BTEkpPwot
IGFuZCBpcyBQSVBFTCA8PiBQSVBMIGFsc28gYSB0eXBvIChJIGRvbid0IGtub3cgd2hpY2ggb25l
IGlzICJjb3JyZWN0Iik/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
