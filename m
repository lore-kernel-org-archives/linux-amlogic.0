Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29F8C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TetmTpoZ4YmteH0KEOzS4Gv0tanl7rODhZvqDEtihC0=; b=ariiGC2UweLdd4
	HGJA0N+4CMaHeS8Vq0ry46dGm9tj/eJJFVW+f1H7/M//K7F3rQs6l4IlPWnp/hGXh3g8zJizrVWwC
	05QPUojMxiVggFQgxxcLVQB/CvpBay+kHBvmZft58GvVlBJhSGN7oZ6jAxQo0rA+hkrqs8zCZgVtP
	BtseRogJ4s3KDRSBGOo+tVN4EAcvYez/2uLl+LMLSuY2qzYxZpku1U5nDosMDLsuXMxDFTYCcopBm
	C/5dCbuDQaRx51g6zkMScL4btHl3/2KE7ES+nGSpfwip1g2zvDh/RZ7x+9lQO9mJXRRL6wybzqaF3
	K+TtUqTziG1yiYxZpXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pguhY-00CSWS-0r;
	Mon, 27 Mar 2023 21:48:28 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pguhW-00CSVl-1N
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 21:48:27 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-545ce8e77fcso118897557b3.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 14:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679953705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdTww4WzcUpLDoiL2bDzx/ldQeZAbCSgPQEL9AHx+Co=;
        b=ws6Qs6nZCHu9bCZ05S9m5EcuGcfNOqs7mTbCwPfPASP6i2cs98NoLhDVm0YWl0BVRo
         gel+5a+Ti2o1fraReFNH5b9h7hGTn7tXgVPbFj7YlNbKGt5XqDrtejiPfweD0+8AZuPE
         tFpcCAlNFSqt8JJwPMs0WxWso++WlAfv1iUi8N+UQgjqZcXSPyL1g3AvQYUZGcSQO9xz
         ETwHwvFg4qSLJLTbVQ8VbVvEw4MS67v88Wc2iM52Elxs5yZ2fI9bJgsoP6sWCMATsgst
         3EN9BhaaraxDRzXFD2QPLaQ+m5lTTzLNh2dE/W29q5LZGYPI6hjoaMMztym02kDG7rTK
         ZS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679953705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdTww4WzcUpLDoiL2bDzx/ldQeZAbCSgPQEL9AHx+Co=;
        b=TeeRb+pRJNKro9mFEfUrYaz6bJEuqiTMqEc+uv1ad59Ip0bxEoYOiJ0Unk0kLIN+tG
         DFqwgBi/Mj7zjyjmHg6bKZLlrbSP/nnIRiaWLkyIEOMrOftHdwQ0d87CgSXzzmIkibn5
         lRTdglo8UWI3OcoT7Ri7xdBHlZ2CGe9BUI7Fi2L1Eg4z+jtABEjbGevpm51zJQItEDzw
         Zpu6PhGr9Qw1BL94x1+HqB0d8Rd7tQAJDgaUtCcaT2JGp/YZ8oVpzpE+8Xq1mJEyz/lK
         XDbEYqfWFfsNCqlDuwoDWItoA0mYqjO6hqYJGvsBqQy6ORA+curBlrmMajsJfe75h/EW
         HzCA==
X-Gm-Message-State: AAQBX9fZOys4+0AycnqTR+Lb7pYn6IiCPjFdqbX3aV+Ma58K3K6z6Q0a
	TN/baJbkZwIOOK6GEu1sijUBIDp2aUZfcu+V181WUg==
X-Google-Smtp-Source: AKy350Ys4b2JB7JAUX9iVy6IEhD3Bi/kXCG2nruSjeIpZO6GuHnrFZeLoV2WgnvD8lgdGNGYCCjSLC9y/fhKrpawBuI=
X-Received: by 2002:a81:e308:0:b0:532:e887:2c23 with SMTP id
 q8-20020a81e308000000b00532e8872c23mr6154400ywl.9.1679953705097; Mon, 27 Mar
 2023 14:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <dd29c1b7-05db-dd98-df40-20a238d89a96@gmail.com>
In-Reply-To: <dd29c1b7-05db-dd98-df40-20a238d89a96@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Mar 2023 23:48:13 +0200
Message-ID: <CACRpkdZZDHriGoUMXX7uSa2K6pPFZooATOuLC1Ye4XiaWbvjWQ@mail.gmail.com>
Subject: Re: [PATCH v8] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_144826_486918_403AABB1 
X-CRM114-Status: UNSURE (   6.12  )
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

T24gU2F0LCBNYXIgMjUsIDIwMjMgYXQgMTI6NTTigK9QTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxs
d2VpdDFAZ21haWwuY29tPiB3cm90ZToKCj4gQ29udmVydCBBbWxvZ2ljIE1lc29uIHBpbiBjb250
cm9sbGVyIGJpbmRpbmcgdG8geWFtbC4KPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0
MUBnbWFpbC5jb20+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
