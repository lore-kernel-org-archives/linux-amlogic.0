Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE94C77B7A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 20:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8Mvm3LsJ4OoEoE6nBsx2BZ28DDHQki+7E4lq+xWSMM=; b=xfTv9PWTNGUZn/
	n2pW3lohnc6WoqYbYcwofbyGrDKNY1rUJsYRjzedu94toCZolNhVj2Ok3RcDvzx/ZN7McY+ejqgLV
	VCl5LyBR30WJEpBIXc5ROusAKm+qhpVR2JmI0fmmj5/cX4Lhx1oljZO72ZOQTkfdI0EyYCVz1K6Kx
	2tb0xfE3/ca8kg/piLMUuTdmn362hCxpZTy1zqo8tmsHOYhihzUTUCa0iTE0dkFnWXNpnS4s01awj
	VwJ+qKe+zWOhl8duSH9mUohyWmPwYpf1V78U8lTw+UrUpERtIPPt9Od2gohB3nkOs839qyJz/uAK3
	g90mE4D9GMLMd06GH+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jgd-00Bely-0a;
	Mon, 29 May 2023 20:41:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jga-00BekR-0K;
	Mon, 29 May 2023 20:41:49 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96f99222e80so769494666b.1;
        Mon, 29 May 2023 13:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685392902; x=1687984902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oVcB/3PU414dGGRa5XjMeY+ZP+wNwSmSLVI+C8Yxe4=;
        b=PsknnEmvP6wS6LwIMVDy541+2wS44WvjbYe8sUGBsjtPB9+YTtBJz367oliJzlKecq
         qq6231HCLJTLj5nXN7fGd4BWOsHorvyobp7shFhPwPsO/X1v6WX+jhZ1Zx3b5XSeWlKz
         FtjUUGlRv8XvuCVIBp62tiplKIsWU8zw/sjzgwccg8RbwYXchQqbZGutTshzbkXFzBrO
         UaXGTDhcQaNqtDwwipJW16ynLAc+dC11VAadqHBTasMdwF0fu8ZK9JWgatpex387mveG
         p9HMIWBB+Sj9NTztwj4F/DX/JGAwW90aChATDjGIY6lziSA71oD4hID+EFJFCvEVbS7t
         6fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685392902; x=1687984902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oVcB/3PU414dGGRa5XjMeY+ZP+wNwSmSLVI+C8Yxe4=;
        b=SMl1HDsO/qMWYSZ7Vsl/QzP1DOVS8e+5i5+WjMNlWgnSOefE6sNMkzAdU4IkJTyGQ8
         behJkneqpWJ40KUHdrmVVoMSkwyVz3QK3YA15neMCA+Lm4Z/zDk+0lsJ6hNlBjjJUslz
         4FPcXQ01AiHNiPqQ0Algtz76P5Rmr5lS3N2nuf1jU+BbVF7MdviFK6z/5XHem3Z/WYx3
         58cMvcwnLxbRJ/yesZTqxnEobOkMydqBs2Ul1jBSi6TauJJu4YcWRL7s26expzHezGbU
         CaCC1Cp2yBsL4L+InFOOMggoDDby4lj9g6w/OHZSwHqbJuAYQG6q1OQe71fUb4GsAmzE
         BgLg==
X-Gm-Message-State: AC+VfDzGTThDjZ+JnIAOadNxdT6D5aPyato5r9sTteb4vBxQgEb9A5lU
	UOM8wPJpLSaiN8B7m+2Icq2KW7ajtIOwPiLeegCD8Csm
X-Google-Smtp-Source: ACHHUZ6207AD0hmd3Pf2Y01WBOzBdWrg6plD6e1TcvbdQOjjEPdECzGbZUSsxNqCyt2hVYSrZgH15bzo3/Efr3x0vzo=
X-Received: by 2002:a17:907:868e:b0:96f:8afc:b310 with SMTP id
 qa14-20020a170907868e00b0096f8afcb310mr238082ejc.3.1685392901963; Mon, 29 May
 2023 13:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
 <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
 <a52335ea-6545-8ca6-d318-38b7ffc64368@lexina.in> <CAFBinCDmkGnD5o_rV6K73De2XmHDxRYveDwNAy3iA+Kwr5sdqg@mail.gmail.com>
 <6910550a-b025-0d97-0b39-bc89b235541e@sberdevices.ru>
In-Reply-To: <6910550a-b025-0d97-0b39-bc89b235541e@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 29 May 2023 22:41:31 +0200
Message-ID: <CAFBinCCk6OziOxt2AY1A25C=9_pibhHsDK0wJNZ_AyHMd=z6SQ@mail.gmail.com>
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
To: =?UTF-8?B?0KHRgtCw0YDQuiDQk9C10L7RgNCz0LjQuSDQndC40LrQvtC70LDQtdCy0LjRhw==?= <GNStark@sberdevices.ru>
Cc: "jic23@kernel.org" <jic23@kernel.org>, Dmitry Rokosov <DDRokosov@sberdevices.ru>, 
	"lars@metafoo.de" <lars@metafoo.de>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>, 
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>, 
	Vyacheslav <adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_134148_146663_1780D3F8 
X-CRM114-Status: GOOD (  10.59  )
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

SGkgR2VvcmdlLAoKT24gTW9uLCBNYXkgMjIsIDIwMjMgYXQgNTo0N+KAr1BNINCh0YLQsNGA0Log
0JPQtdC+0YDQs9C40Lkg0J3QuNC60L7Qu9Cw0LXQstC40YcKPEdOU3RhcmtAc2JlcmRldmljZXMu
cnU+IHdyb3RlOgo+Cj4gSGVsbG8gTWFydGluCj4KPiBBY3R1YWxseSB5b3Ugd2VyZSByaWdodCB0
aGF0IG15IHBhdGNoIGFmZmVjdHMgb25seSBtZXNvbjggZmFtaWx5IG5vdCB0aGUgYWxsIG5ldyBv
bmVzLCBteSBiYWQuCj4gSXQncyBjbGVhciBmcm9tIHRoZSBkcml2ZXIgY29kZSBtZXNvbl9zYXJh
ZGMuYyBhbmQgZHRzIGZpbGVzLgo+IEkndmUgbWFkZSBhbiBleHBlcmltZW50IG9uIGExMTNsIHNv
YyAtIGNoYW5naW5nY2xvY2tfcmF0ZSBpbm1lc29uX3Nhcl9hZGNfcGFyYW0gYW5kIG1lYXN1cmlu
ZyBhZGMgY2hhbm5lbCBtYW55IHRpbWVzCj4gYW5kIHdpdGggbG93IGNsb2NrZnJlcXVlbmN5IChw
cml2LT5hZGNfY2xrKSB0aW1lIG9mIG1lYXN1cmVtZW50aXMgaGlnaAo+IGFuZCB2aWNlIHZlcnNh
LiBBRENfQ0xLX0RJViBmaWVsZCBpbiBTQVJfQURDX1JFRzMgaXMgYWx3YXlzIHplcm8uClRoYW5r
cyBmb3Igc2hhcmluZyB5b3VyIGZpbmRpbmdzIQoKPiBJIG5lZWQgdG8gZ2V0IHM4MDUgKG1lc29u
OCkgYm9hcmQgZm9yIGV4YW1wbGUgYW5kIG1hZGUgZXhwZXJpbWVudCBvbiBpdC4KSWYgeW91IGRv
bid0IGZpbmQgYW55IE1lc29uOCAoUzgwMikvTWVzb244YiAoUzgwNSkgb3IgTWVzb244bTIgKFM4
MTIpCmJvYXJkIHRoZW4gcGxlYXNlIHByb3ZpZGUgdGhlIGNvZGUgdGhhdCB5b3UgdXNlZCBmb3Ig
eW91ciBleHBlcmltZW50CmFzIGEgcGF0Y2ggc28gSSBjYW4gZ2l2ZSBpdCBhIHRyeSBvbiBteSBP
ZHJvaWQtQzEgKE1lc29uOGIpLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
