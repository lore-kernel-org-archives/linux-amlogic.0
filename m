Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54736CE7A94
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Sep 2023 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZS1OHEE9HxKokbhjLa94UFTBe99+JtZ7YTbMw2baSY=; b=jHHFLkNLfwfuB4
	+jULmMEZZfGbRowzfW/69DDIOKHAJVFx0GeOn7o64HKoCSS+L1PnkaDkkMNcase89ed+7QWsvfmTk
	GwZ7O3GguzsIbfhnOd5BojxS6J9WcU/B3fpWaO4F/zlyGbT3WWNItmB/R/H+RBO1C0Aq08vXPj1yi
	FZt8XmPNBOIc75FVe/RULeT7rMYjwy5yVxWjhZYf0YpgaewkjSHJUsp3SnwpvnG0BkaPIzaNeb2xk
	IVpWb2D/JoM5+1vAmP7y8Wb8Zi0leI6oBwY9kY11+oYU2lHEdfw4R6I3ojdlhThSlYtkuCZ6pHY3f
	qPhKdIWkx3mUdUUs6uZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklzd-00EO4a-1E;
	Mon, 25 Sep 2023 13:51:21 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qklzZ-00EO28-1H
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Sep 2023 13:51:18 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-59f1dff5298so69017767b3.3
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Sep 2023 06:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695649874; x=1696254674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bUGxBdoZWk95GXxSCfS15Sr8JU25TCNaLxBll4hkMI=;
        b=ZKozb9IIWtrYmd67xdZkzTSXGhzPg6v2UHyrJ6oKycdHLIOH0fgYlMKW8DIzHJujOK
         dPX2rjzBZhEur/3T6IYzV2h0m+q25wV4QYmZ75eUJzgsdaDR0KHjap8Uc93ufe1Z5a5C
         8SODVAbauJNncrhjmKeVZlMKNFA5T6X/J6brpSB13y+BXFPEuQq+gdRkc45p1pLRFptm
         8lvYCSlutLsdXjv8vC/+Gz0teAcGeDlVoX6lViv8nklErwbELVUR/d3PgiLENz8rOtmu
         ENZ64ZXR0iiBGWhAaoE1GVu442u6JTpnwi218D+r6yMqRGZlU8Fdgc5moGBmx9fewTh1
         1aQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649874; x=1696254674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bUGxBdoZWk95GXxSCfS15Sr8JU25TCNaLxBll4hkMI=;
        b=ZrBH/Zv8ghWpnt+57jUi5ebQat6DjOZxLlRXxvXqAMwsEyzFsnOCc+viBjmC1L0blG
         XF006Pj08zMUw1/exKQxFs4z0oTL5NC2RkXL/sZeaKs7jLSAydR/o9WKCW5qoPxrFkNP
         Z8N/3TfZjrs+cck3HXBG/wNzzww67+PH2kzIXL0oY9bwZAdJ8QIpyK0cyIKZHP7hDFK9
         0KVc8oe0Pd2xOCQv8dsHM93/1GNGI0tjiBI7GZzVvQXzxF3Lp0bd59BDZ8oMk85vipLI
         aaf6pVxEWtP2Ty+nSfNGZg8Sz7uQ+tF+Zjq0qOQ9UPR7T5+YNVwvgh7sEmtBJWa4c6LQ
         0vOg==
X-Gm-Message-State: AOJu0YxDqAOF9UvM/DPHZeZip10LL4hUTWGmFjZKKH/VHahKcejmPzCn
	TvtSHyCJ4iRo0a8pFhWLJq2w9VA8WIIK5+TKfNcws8glEs9WiLUuTxo=
X-Google-Smtp-Source: AGHT+IGq9PF+eLdL5exgxFzGnnWVmXtEx1HNmz2junPvjtsrRkl+q2gThKlLXAcV7rSLXfb0Ef3kqT5/OTf7L0j2rVE=
X-Received: by 2002:a05:690c:360d:b0:59c:682:78e5 with SMTP id
 ft13-20020a05690c360d00b0059c068278e5mr6471226ywb.18.1695649874286; Mon, 25
 Sep 2023 06:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230922094342.637251-1-huqiang.qin@amlogic.com>
In-Reply-To: <20230922094342.637251-1-huqiang.qin@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Sep 2023 15:51:03 +0200
Message-ID: <CACRpkdZ7UpF_U5OaVstJAOHc7_RVnnBT+daNm0FOgL7g3piCbQ@mail.gmail.com>
Subject: Re: [PATCH V3 0/3] Add pinctrl driver support for Amlogic T7 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_065117_459695_C218A80E 
X-CRM114-Status: UNSURE (   9.50  )
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

SGkgSHVxaWFuZywKCk9uIEZyaSwgU2VwIDIyLCAyMDIzIGF0IDExOjQz4oCvQU0gSHVxaWFuZyBR
aW4gPGh1cWlhbmcucWluQGFtbG9naWMuY29tPiB3cm90ZToKCj4gSHVxaWFuZyBRaW4gKDMpOgo+
ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBzdXBwb3J0IGZvciBBbWxvZ2ljIFQ3IFNvQ3MK
PiAgIHBpbmN0cmw6IEFkZCBkcml2ZXIgc3VwcG9ydCBmb3IgQW1sb2dpYyBUNyBTb0NzCgpUaGVz
ZSB0d28gcGF0Y2hlcyBhcHBsaWVkIHRvIHRoZSBwaW5jdHJsIHRyZWUhCgo+ICAgYXJtNjQ6IGR0
czogQWRkIHBpbmN0cmwgbm9kZSBmb3IgQW1sb2dpYyBUNyBTb0NzCgpQbGVhc2UgZnVubmVsIHRo
aXMgdGhyb3VnaCB0aGUgQVJNIFNvQyB0cmVlLgpJZiB5b3UgbmVlZCBkZXBlbmRlbmNpZXMsIHRo
ZSBTb0MgbWFpbmF0aW5lcnMgY2FuIHB1bGwKaW4gdGhpcyBpbW11dGFibGUgYnJhbmNoOgpodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9saW51c3cvbGludXgt
cGluY3RybC5naXQvbG9nLz9oPWliLWFtbG9naWMtdDcKCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
