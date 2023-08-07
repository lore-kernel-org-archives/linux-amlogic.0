Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7E8C00528
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Aug 2023 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74pBwKdE8ZCOZJjAVEqbzyUl9R6OJnczVb8oRJP6ggM=; b=KxVLk6i9qzZBEm
	14flM49qUpHkv+cRwlkPS2JyQH5vRtB0bmj2hCJ1oMM1RlTOZY9CuDOnLUjC6TtU1UKsR197kMRCn
	5u5SDyArI013d7fwNnVMbSlnQknyQzVrQzpHXE+Fx0ktRjetKOKBpjTJ2ecIhjJBdQFoLnwBLyM6i
	iGgi9DD1SIOfWJ7pDaK8+3hARaBnuLrCBzpySK8eVJsnGemX7aPfEQD1bSD/MCQ4VmGXgRo2nHx0k
	tO0LqJ4+gmxNPDulq5Q06p2p9gAIz9sWuQA6beRu4kMgJ5nWyndVF5ZN4KP8SuDUZWvOto+82GvYI
	+qf9As0tiBCgAqyv3Xkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0S3-00HPp6-2s;
	Mon, 07 Aug 2023 13:39:15 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0S0-00HPml-28
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Aug 2023 13:39:13 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-58439daf39fso49088517b3.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Aug 2023 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691415550; x=1692020350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRDT9DXBzQlTjPrZAhEg59Olbt5sHylTIeFizzconrE=;
        b=WWj1VMRsFjhJYS9j5EcWQz80Rwb9c4CFPW+X/veRPzcjP6bQYlI8+IBKtLrZRyXcKn
         2VOWgfeqxdR2sYk2hA5qDR0AiQezwK0Vg7Ati5GcgJsNYyqlBfBcXQbJ8cHAXfvt0Mti
         +YwEdYUjsc7cIaIZIiYqsS/Jge/eQi/RRiolkpH2NQHjg7dON76ErQNRE0CR3wqgRqYT
         Eui8biZAxl4u7cVjdgZX/qsRojDmDkLUqW1cr7oZWi3Fy8eyaSrgrW5IXIGTZsv8ZywA
         L1HsLMNAXaiKhb5puVZgh3fAWXKY0swJuJeerQB8ZF+S9UsYVA0hqeu27OLKsOLBS//3
         N+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415550; x=1692020350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRDT9DXBzQlTjPrZAhEg59Olbt5sHylTIeFizzconrE=;
        b=RlQ+dhXauNgAutl2I8TExO3kMdXH/6AblPhxGSbTT6jvpkYIq9i59qGYG+iGhYgK5b
         MTIbKvKwjeeq5wxp5jYutuPUzVXeJZ3mIEOajeNEFLPw3lGSu0F+vC81qr4Qq0EM+QIW
         le6gkLZvbPp0O0eiEY6q2qIRoSObJitvo1ZqnXmMtQ9NraZ14kNVyLGzL2M0oS0eEXEf
         W7mYjfEG0PPHiRAwsqRrUWsSKPykFmphfVJtxzI5TnQhww+h3KOCwhXl7Km3cDEEyH6s
         yFFvFuKeXho93tg5pQ0ycRXmpAPjkB374c/XGoW8eh2A7m/l5Bj4nD9jLX71YNUiFJI5
         wXvA==
X-Gm-Message-State: AOJu0YzkBTE3hzyEPAiA70qwgVIDIKOtNTavjIL0yg+zq+rjbNr5GMru
	MNljZYZEBDujF3NahG3UHxSSgFvsGr1DOYCnUJgb4g==
X-Google-Smtp-Source: AGHT+IEgUqiyfEGaIlKKBGfAfYasMwxTYrCOJerBNORMgootu9kvLZhnNC9y1WNIMYu+b/QBI2QTxv5w159iXcMsfwM=
X-Received: by 2002:a05:6902:1024:b0:d4d:3551:15d0 with SMTP id
 x4-20020a056902102400b00d4d355115d0mr5414866ybt.61.1691415549840; Mon, 07 Aug
 2023 06:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
 <20230721073214.1876417-4-huqiang.qin@amlogic.com> <7hcz0ei9r4.fsf@baylibre.com>
 <9da24c47-341b-1581-0043-a6c1cdce462d@amlogic.com> <7hh6pnhn45.fsf@baylibre.com>
 <35713689-2b28-192c-5004-8a0ba6b9308b@amlogic.com>
In-Reply-To: <35713689-2b28-192c-5004-8a0ba6b9308b@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 15:38:58 +0200
Message-ID: <CACRpkdaY-RNjiibVX0sZpxG39mqZGP-+nUg1sCBhF_N=4D8aNQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: Replace the IRQ number with the IRQID
 macro definition
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_063912_698348_58B8571E 
X-CRM114-Status: UNSURE (   7.79  )
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

T24gVHVlLCBBdWcgMSwgMjAyMyBhdCAzOjI14oCvUE0gSHVxaWFuZyBRaW4gPGh1cWlhbmcucWlu
QGFtbG9naWMuY29tPiB3cm90ZToKCj4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwgSSdsbCBh
ZGQgaXQgdG8gdGhlIGNvdmVyIGxldHRlciBmb3IgdGhlIHBhdGNoIHYzLgo+IChwYXRjaCB2MiB3
YXMgc2VudCBiZWZvcmUgeW91ciByZXBseSkKCk5vIG5lZWQgdG8gc2VuZCBhIHYzLCBJIGp1c3Qg
YXBwbGllZCB2MiB0byB0aGUgcGluY3RybCB0cmVlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
