Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E37CD6E4A
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 05:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z42/ebcdrVvXp1/VELxmzJ8hxuwwXcinPdC5EMQ1mU4=; b=Q0JbvaygkKD7HU
	4133rLF+i61MX1NYOhW6okw1xh5almCJRuQC6s4OrSt5tC4ZWHaKABuBfNQicpnMOA5lJOoU4uf9H
	6cCDQS8A1/pZI7AjyhxgZS2vim19QI8U8Yh3Tyoo2BdvVSB1vCuxkRrBaUTZx8aaf87JwQvEZj4dg
	D7cWp5yu8cM3wkhkwnTKL0n2yBuzCu0Qx44hG9CSywhHr18zOdIHgxrrWCm08uQfrETyHFvv7cyHe
	FFf3IOUyoLPjf/e6/hha0gRNW3iloMZHZNkB87sVJoDD0PbAjLf/XYfdPTOgbcr8eYkdFqGWHqhb6
	/EFYP2h0cx/PADhxyyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHyF-0000000CLF2-3VXv;
	Tue, 02 Jun 2026 05:47:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHyC-0000000CLEL-1Daf
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 05:47:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c0a5354da1so19153125ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jun 2026 22:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780379239; cv=none;
        d=google.com; s=arc-20240605;
        b=hPwXismNFM4sv55FklWDgFviveQQ8BErW8ak6afFkvwOBLrEEloZplWYzrlcvGJgjM
         m9pyxpyJmTu+7PHFvBQWdPic/n0c4i1V+3yXhKzdVWH6j6YQ4Kec/xU1vIQIjzyMnLrY
         beDXcwlz5IM45p5Pa496VSZYJRytgjRH2jZaASCIr3f1zfXcK2sFkvvScZCgoOjXJwv6
         GBGD/Za4OsHIChBLXbUQKaRRxdsQPE4lkDG141NB5EQrGwRYcjPsnIkAWQEw8gHu4Rtu
         JoPv9krLhJLEhFmurZFAomVNVY/XFYyGz3tMLJ5ul4Sfn/5/JOutDUqb4khHb7oHddQ7
         Bq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        fh=PK0e6boZEgdkPjK4zDG8fSXeZlOLATgMsWOvhpBXrMU=;
        b=TH93mqip0OY9F1tHlS1fM38Ibd8RPedYYr9RoASdKgeyqqBkzV8y7zg4zvZean9mNs
         avPv2H4/KaZOjrCrq08Ac2Tc98wV7bo26QQT0blLd8Hbc7HmX5W9QP8oDruNGNJz+0a/
         bLLID4kGi9BAwnDMl07YBEnkARHlbuf6t+q1bYQij94XJk6r3lhzXRhE9TH3VJhhOpIk
         Cvwb96bnXEfeRId6aWKL19SHVODhnQK5FWLsuKzZA8nGgHks0Xm+wBJh//mgdDYsrtLo
         h/v+QYi22X0vklNXdGXSD4/V3n5wOX7fvM7iTUNQ3t+6y0qgh/PhlL2x7IfVHpOywdtL
         J6WA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1780379239; x=1780984039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        b=SbindI4l3D3YzCr/SOIUHZi4tGgeY5daLCMOUtFRZWaAuK7sw1Sbi7o/du0rAPYstK
         u0KTSYOP4SuL04bNYCevAwvyrq7eoCs9lFdqoj2WkULEuQUBUM1mgCNna5rQQp9iVqq1
         9fFmpAm8HC8ZCplkt3a9WgIa7U0mCE0y/CVV7dZRLADKz3GBtmH+h22F4+D91EWHBqvT
         ZUR0Rsn3K6b0EPWy4ujN8U6uxHOobwG72iCE5xTqsgELp58PsdarBTATRXSEUG/y7kA4
         XDK6FVXmkcv2eZsre+6HzKWpFV0Q4SA3RoTKHr0eMji3T7P0RghZEWkCXYV689HLxFc0
         u/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780379239; x=1780984039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        b=EaljdMHPBTsJUpirZi7hIHTctoHn2V3bXPjzFvbXP7mzJAVheJC9n3k7ELy/g21Tqy
         nyEVXCg21en0f8mkWUUlKq2uLDiDoJlL4SBVRnBBugQMxiPRdMHsdtTPc/hp975+DbGd
         yUO53564cYXORtBinxhHIsnI3qusSRV2IONgxrPpLNpRgvtaJRVBR8ny7cTNG6YCkt3M
         guzY2+cimm6C2t5f+yTCQcMmSnEgheVb8LAfbbV9oTPQ2McxktSwNrXaTFMIbDe/n4cT
         WKXXMoFS8lddMjMPbI7Nqp9LNXe0RjDd0DKmjsOrIm44/hfg/hxpozGJy06k1PD7AJRr
         T3nA==
X-Forwarded-Encrypted: i=1; AFNElJ/EG2Qx3MtSRPShl8aK751Gry/yYvsaOyIeV3XIE2NvLPlt4O2ubMjUGYYplfwK5dBbyEI/cHP/LZIKwO2t@lists.infradead.org
X-Gm-Message-State: AOJu0YwyZqoSODb2DPWVqasR4o+/iWM7lIWxzcBemGWaVygEGc3OxaB6
	eCj17wjoLq/m/ljBgiLygCKVwzxOYii3mbzLoCmBjMgcYzRTBYc8kKK/sWMGUUggIkjsqP2dn8f
	PKbgG81eWA+qvfQ5ydkPoUS1Yx+b65SAuTlgJ
X-Gm-Gg: Acq92OF0IOvd2yYkBzOQlJiTpD8ANFlb0KHOw57w8QRYgrkdHaowVI9WxxLNJtGerq4
	xWWyn0cymH6yUSRYp1a2O5tZwJ3q7B0cirDoOnimBp3gmDKdXipWASZz7r3iVTnwqLxGklcSn98
	2Js33IM/heJVlRdI5OHxQu9NfGib36V+8hl0TXaOaMjLcP7Wyyx96Wei8PXEjy/tJR7gniZhUsE
	HL/2N5oOpmG62iDfe++7uN8n7LhnT/0RqXAdPKziBBnzhYOlDLR4CEjCVBhyy0srJJlLjdvesIb
	v729SYnHvwBz03uBbDj3UeAEaFZhGobSwt6QppElqP3SzLOa9X0=
X-Received: by 2002:a17:902:f606:b0:2bf:367b:f46f with SMTP id
 d9443c01a7336-2c10cd1dbaamr21848025ad.30.1780379238839; Mon, 01 Jun 2026
 22:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org> <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
In-Reply-To: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 2 Jun 2026 07:47:07 +0200
X-Gm-Features: AVHnY4IB5RtNIaO0mVfpt98zsyzRrKUY-xCKF5XmkQB8dMk3X6syT-ZazZkET0k
Message-ID: <CAFBinCBS_38Yg6aXFpKhpufEaYn7biUEDLnB9tn6Si7TFHdSuw@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, soc@kernel.org, arm@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_224720_327597_05B622A6 
X-CRM114-Status: GOOD (  14.78  )
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

SGkgTGludXMsCgpPbiBNb24sIEp1biAxLCAyMDI2IGF0IDEwOjA24oCvUE0gTGludXMgV2FsbGVp
aiA8bGludXN3QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgTmVpbCwKPgo+IHRoYW5rcyBmb3Ig
eW91ciBwdWxsIHJlcXVlc3QhCj4KPiBPbiBUaHUsIE1heSAyMSwgMjAyNiBhdCAzOjE54oCvUE0g
TmVpbCBBcm1zdHJvbmcKPiA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiA+
ICAgICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiB0Nzoga2hhZGFzLXZpbTQ6IFJlbW92ZSBpbnZh
bGlkIHByb3BlcnR5Cj4KPiBUaGlzIGNvbW1pdCBoYXMgYSBwcm9ibGVtYXRpYyBGaXhlczoKPgo+
IGNvbW1pdCA2ZjE0YmEzYzNmYTNkNjdiNzJlMDUyZjQzMWY2Nzc2NDcwZWIyY2JkCj4gQXV0aG9y
OiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiBEYXRlOiAgIE1v
biBNYXIgMzAgMTQ6MTE6MjEgMjAyNiArMDIwMAo+Cj4gICAgIGFybTY0OiBkdHM6IGFtbG9naWM6
IHQ3OiBraGFkYXMtdmltNDogUmVtb3ZlIGludmFsaWQgcHJvcGVydHkKPgo+ICAgICBGaXggaW50
cm9kdWNlZCBpbnZhbGlkIHByb3BlcnR5IGZvciBLaGFkYXMgVklNNCBzZGNhcmQgcmVndWxhdG9y
Lgo+Cj4gICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1r
aGFkYXMtdmltNC5kdGI6Cj4gcmVndWxhdG9yLXNkY2FyZC0zdjMgKHJlZ3VsYXRvci1maXhlZCk6
IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdAo+IGFsbG93ZWQgKCdlbmFibGUtYWN0aXZl
LWxvdycgd2FzIHVuZXhwZWN0ZWQpCj4KPiAgICAgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90IDxsa3BAaW50ZWwuY29tPgo+ICAgICBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L29lLWtidWlsZC1hbGwvMjAyNjAzMjkwODI4LjVndDM5M3Q2LWxrcEBpbnRlbC5jb20vCj4gICAg
IEZpeGVzOiA2MGVmZjc1YWM2N2IgKCJhcm02NDogZHRzOiBhbWxvZ2ljOiB0Nzoga2hhZGFzLXZp
bTQ6IEFkZAo+IHBvd2VyIHJlZ3VsYXRvcnMiKQo+ICAgICBSZXZpZXdlZC1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPgo+ICAgICBT
aWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4K
PiAgICAgTGluazogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwMzMwLWZpeC1pbnZhbGlk
LXByb3BlcnR5LXYyLTEtMjI4YzUxYzhkZTkzQGFsaWVsLmZyCj4gICAgIFNpZ25lZC1vZmYtYnk6
IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+Cj4gQ29tbWl0IDYw
ZWZmNzVhYzY3YiBkb2VzIG5vdCBleGlzdCBpbiB0aGUgU29DIHRyZWUgbm9yIGluIFRvcnZhbGRz
Jwo+IHRyZWUuClRoYXQgc2hvdWxkIGJlIDhmNGU0ZmJkNTA3MiAod2hpY2ggaXMgcGFydCBvZiB0
aGlzIFBSIC0gYXMgdGhlCmV4dHJhbmVvdXMgcHJvcGVydHkgd2FzIG9ubHkgZm91bmQgYWZ0ZXIg
YXBwbHlpbmcpLgpJdCBzZWVtcyB0aGF0IE5laWwgZGlkIHJlYmFzZSAodG8gbW9kaWZ5IG9yIGRy
b3AgYSBjb21taXQ/KSBhZnRlciB0aGlzCmZpeCB3YXMgYXBwbGllZC4gQnV0IEkgY2FuJ3QgZnVs
bHkgcmVjYWxsIHRoZSBkZXRhaWxzLgpMaW51cywgd2hhdCdzIHRoZSBzdWdnZXN0ZWQgZml4IGlu
IHRoaXMgc2l0dWF0aW9uPwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
