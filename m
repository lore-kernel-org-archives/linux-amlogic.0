Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37419C77B60
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TV1FvDR71vSSjUfC1SqYcJAXBUHlhi8TDqR2w1Rq0gA=; b=iYG/RZVWvNPexz
	vtZBX/F0MNpvjn26fZ0LFlHz1HOz+fEH5q1AHO53dyFeJYI2TAnyCsLef3F39CSGziNQW7nwrzNWE
	mxxlQYWjC4p7tk0Zb+eEn47df4fdV2YmJiqH56Cax4jFh48R9ZWrvDO3mHjJ3W+6j2howqRxmTyun
	yDITaCrGfBGmdVJAT2Ev42u3ZlRZnw22x9iX/P+4OYAghdXI+b5Wp7vNaK0rX+CFjUxCoeiRvF9pC
	T4PtUlGEhTX85zWehCSgKLEf6Wyt1Web4nDsmzr4tFOaTtGuOpbG9nTOthPA+El1vMyR2cF2KyWZz
	ErAbuwwe5MIcGyRcCmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqgkE-00EjrB-26;
	Sun, 23 Apr 2023 20:55:38 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqgk9-00EjqW-0x;
	Sun, 23 Apr 2023 20:55:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9505214c47fso673884966b.1;
        Sun, 23 Apr 2023 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682283331; x=1684875331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcgYo5hEprZMBHNoav25W6j8Pl8FNmsiW4q1h+BqMOg=;
        b=EqAUQeM0JQuXSYgqSJ/To+DxOQlUK6sx/O8xDPDsFp6xME8SzzX/YczB61sbgvK8kI
         hFDakjI4z+FwEb+CZkJMp6BjqhUSmJom9SllgiOOE4AuKElMDaAP3ZGD3f9kEIDy9eJj
         hcKLfWQycIpZ23PCuiCVy/5/3VPtEzcHbIQ1xqFNZLBlYEpSnV/p9VKGZPTgQPZ6q7qb
         gGjzPVdxDS5et5ASt/a07AceoEiehl9JLXKMpbhTCELg6OfENKzW2uAzut/Rrmh4jGZU
         5XH9ENAUp5OSVcBY4ujTzHhTSNsof5nUzQN4zyAuTquV4u3G1rq+mXF1zyqQxtsTgaAU
         avWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682283331; x=1684875331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcgYo5hEprZMBHNoav25W6j8Pl8FNmsiW4q1h+BqMOg=;
        b=gAUxl0HUfwezxRYR+fC+/4TmPs3kY4KbQYyEPI1tA+jnfL6iv1zmEkDQiuN+yFnhCJ
         TDco5KeCKBKNNW1Sgge7ZSUMIZl3tgZsz/En5ew7Rg4J480Llwxx6lYq3PlLQAQp/h5R
         oDBSTQGWXWkg1pKQfxZiSpQcppjh5dRRFNlJQF1qbodljflkvy1cfwTxHwjh4f4TSJxM
         vEc2KhLimpmS3fJvUmpEv6Ecai19VOeXbs2ej+zYsstcl2vMi/GK7xQuFdzNuDKjbJ6i
         IE9tsGi61D9PG859kYBUW+Y7AP5PDjdtpye3qFtiYaJ574rIXHYt6D6vliXqb+ciy//J
         Sg9w==
X-Gm-Message-State: AAQBX9dsqxBh1Y9GM4Is8M1tcftXmNj6Y5y0p1P8XJCXSQRxeRWX4t99
	A68RJGXAol3re2Aqr5r6CcbDzVPdrByAov38Va8=
X-Google-Smtp-Source: AKy350aBCl5IMD8yacgRUJSjCF67IzlNv8X577NfRZKiHofEPTM2cRgkm4RyTznBIgphDn+X81O96kSv/oVxlpnVS48=
X-Received: by 2002:a17:906:a2da:b0:946:be05:ed7a with SMTP id
 by26-20020a170906a2da00b00946be05ed7amr8288089ejb.70.1682283331025; Sun, 23
 Apr 2023 13:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com> <CAFBinCCzMdQZ4mDF7SEZKHc01MPSepxdzYa+j7G-qDXe5-kBVA@mail.gmail.com>
 <4b328dab-5f96-e5d0-3181-ce059d11b04b@gmail.com> <CAFBinCCxQvB_fY0r4jkwy7zW1F9s2vrxmcRaTs6hG5ay_Gf8mw@mail.gmail.com>
 <7601c976-3195-a35d-236c-9bd386dfe8e0@gmail.com>
In-Reply-To: <7601c976-3195-a35d-236c-9bd386dfe8e0@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 22:55:19 +0200
Message-ID: <CAFBinCCV95Q8eCvUBH0VHgFdm7_kot5oVfPdBTppUQbw2g0+qw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_135533_378335_EF026BC6 
X-CRM114-Status: GOOD (  15.16  )
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

SGVsbG8gSGVpbmVyLAoKYXBvbG9naWVzIGZvciB0aGUgbGF0ZSByZXBseSAtIEkndmUgYmVlbiBi
dXN5IHdpdGggb2ZmbGluZSB0aGluZ3MuCgpPbiBTdW4sIEFwciAxNiwgMjAyMyBhdCAxMTozNOKA
r1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+
ID4+IFdpdGggYSA4NTBNSHogaW5wdXQgY2xvY2sgd2Ugc2hvdWxkIHNlZSBhIDAuMDElIGR1dHkg
Y3ljbGUgd2l0aCAxLjJucwo+ID4+IGNsb2NrIHB1bHNlcy4gQ2FuIHdlIHJ1bGUgb3V0IGFuIGlz
c3VlIHdpdGggdGhlIG1lYXN1cmluZyBlcXVpcG1lbnQ/Cj4gPj4gSXMgeW91ciBsb2dpYyBhbmFs
eXplciBhYmxlIHRvIGRpc3BsYXkgc3VjaCBzaG9ydCBjbG9jayBwdWxzZXM/Cj4gPiBPaCwgeW91
J3JlIHJpZ2h0OiBteSBsb2dpYyBhbmFseXplciBtYXhlcyBvdXQgYXQgMjRNSHogKH40Mm5zKS4K
PiA+IFNvIHdlIGNhbiBpZ25vcmUgdGhpcyBjYXNlLgo+ID4KPiA+Pj4gRmluYWxseSBJIHRyaWVk
IHBlcmlvZCA9IDEyMjE4LCBkdXR5IGN5Y2xlID0gMTIyMTggKHR5cGljYWxseSB1c2VkIGZvcgo+
ID4+PiB0aGUgbG93ZXN0IENQVSB2b2x0YWdlKToKPiA+Pj4gYmVmb3JlIHlvdXIgcGF0Y2hlcyAv
IGFmdGVyIGFwcGx5aW5nIHlvdXIgcGF0Y2hlczoKPiA+Pj4gUFdNOiBkdXR5IGN5Y2xlOiA5OS42
NjEwMTclIC8gbi9hIChjb25zdGFudCBsb3cgb3V0cHV0KQo+ID4gSSBoYXZlIHRvIGNvcnJlY3Qg
bXlzZWxmOiBmb3IgdGhpcyBjYXNlIG15IGxvZ2ljIGFuYWx5emVyIHNlZXMgYToKPiA+IGNvbnN0
YW50IGhpZ2ggc2lnbmFsCj4gPgo+IFNvIGNvbmNsdXNpb24gaXMgdGhhdCB0aGUgUFdNIG91dHB1
dCBpcyBhcyBleHBlY3RlZD8gSWYgeWVzLCB0aGVuIHRoZQo+IG1lbW9yeSBjb3JydXB0aW9uIHlv
dSBzYXcgc3VwcG9zZWRseSBoYWQgYW5vdGhlciByb290IGNhdXNlPwpZb3UgYXJlIHJpZ2h0Ogot
IEZvciB0aGlzIGNhc2UgbXkgbG9naWMgYW5hbHl6ZXIgaXMgYWxzbyB0b28gc2xvdwotIEluIHRo
ZSBtZWFudGltZSBJJ3ZlIGJlZW4gYWJsZSB0byByZXByb2R1Y2UgdGhlIG1lbW9yeSBjb3JydXB0
aW9uCmlzc3VlIHdpdGhvdXQgeW91ciBwYXRjaAoKPiBFdmVudHVhbGx5IHlvdXIgVGVzdGVkLWJ5
IGNvdWxkIGJlIHJlLWluc3RhbnRpYXRlZD8KSW5kZWVkLCBhbmQgaW4gYWRkaXRpb24gdG8gU00x
IEkgaGF2ZSBhbHNvIHRlc3RlZCBpdCBvbiBLaGFkYXMgVklNMiAoR1hNIFNvQyk6ClsgICAgNC4x
MzU5NDRdIGJyY21mbWFjOiBicmNtZl9jX3ByZWluaXRfZGNtZHM6IEZpcm13YXJlOiBCQ000MzU2
LzIKd2wwOiBBcHIgIDkgMjAyMSAwMDo0MDowNyB2ZXJzaW9uIDcuMzUuMzQ5LjEwNCAoNzc1YTlh
YiBDWSkgRldJRAowMS02NGI2MDllMAoKVGVzdGVkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKCkJlc3QgcmVnYXJkcywKTWFydGlu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
