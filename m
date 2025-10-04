Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0E5CAC5BB
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Oct 2025 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4NRCesOX6VAWzyNQ5HRVVUEt7S5KIssE+Q+PUHMCk4=; b=UTCSbyQaF+WGy7
	GSpI4ufwR0gpvNds3z8soG8RjFfe9xpmmckso/ULbqQdVSP0gWFYMmGI8YWyrDkvMW9z3fLOvz5op
	WZXDWsq95Ojohq/lTG9SvtxQibsxRYhSd9ZIwDmJPZxMNUBbxjn/UZygx8ZoaW5GwE+Qf92lbQ2I4
	11WMRMpJGJgWSX1ERdPK0wTYxgdnyN5JiKCfhgZZjhNR/Y8J4lPXMR5sG8psg3z67/82xUZOb3DaE
	Qu0Bj10it4XU3zW80IBvqxXEM8N6JBimH4UiU6NvosgObW6VT6+l9UAexgjMHtmJaIV4c9Rg3QVP7
	GnoNc8PiGa1gVkJhmnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58QS-0000000DyrX-1yW0;
	Sat, 04 Oct 2025 20:00:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58QQ-0000000DyqV-0NWU
	for linux-amlogic@lists.infradead.org;
	Sat, 04 Oct 2025 20:00:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-269af38418aso41929275ad.1
        for <linux-amlogic@lists.infradead.org>; Sat, 04 Oct 2025 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759608013; x=1760212813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAAATEzUG/gnyFxR4G/qPSO1lh1Qm5uC32oRTnBeWCk=;
        b=WQSi2TSgi9qUpJW/qbpMdq4sDdTZqlJgo6UjlRKag35zXiVEV4iqgSs+4WB/f/ZO5p
         bZYIKt1IRne/GUQCB8I+8PgM36JBSHPxc6fdQc4XtyO0jWQ6ZLm4wgKfmWLYqUD7k4Q2
         gkq1S1OFLe6psDvnjJyBohYw03HC6QKRy7ailVW7azYj0O3tLoS/Fdmda4dhHI9l1uFm
         csSklf3EYtDDpAJXQiPrw169n5vQNMHu/1PTt2weOwwKOptcRyMACkIu9HhQWIO2NV3q
         p1fsoXnBXUpj5oQWvY8o5xYJoBngTIHEggaJ5A44bfbOmIbqcEv/M0Jz3gyp08vDElOH
         uBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759608013; x=1760212813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAAATEzUG/gnyFxR4G/qPSO1lh1Qm5uC32oRTnBeWCk=;
        b=hoed75gj1CznGm9emneNfF5Yr27DjVoehm4Ud8W/fiOxpDxRFQl2ClKdqv5BmlcNNb
         X+cteHEg2EY0zOobCT8cTe8ugWNhYRnWWk1E1h4IsuHYdB5+BrMI9iSLYYyV/og2SbAt
         cXAjLWnRE/XQxTDlUppzswsUQO18T4R3oWPibONjp0FWz5yRzXD6d5Zwqk7Gf3MwvuuE
         rOZVGaSYAsbWxjJYlQmBBv4XmF/X57wcWo8IkgNwsDfUPS+9foXcVWjTjdyCgEWkdYMx
         UvBGdlMhWZTqDWI171EZK9RpStHd9S61Fj/uZploWLysfWxPypSDcIFzsnS/2S3EhgVk
         Zt9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGXY6n/TVRbw0iiLsAmW79Mxsxdts08BAzHJcfUbwLq74SJeRysvZi/Sxw3HdKBuaAdQ1HVX3IoaSbSGIf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp4CFfDYZUTQX/zqZllOgb5W4qKM/glahHV7YtRqopdCGtCDyd
	es0mJqiGcPVoL1XeD9JmSYJD1aCJ8TbRv7mDAoyYzXjReDBvT+eptLkp86sgvCfIm2zZ6P7Uslh
	3YCwRAXUud8QNc/ywKvbYtc9mUkNlseE=
X-Gm-Gg: ASbGncuPjXLiNQ/ABsMv693Rk9Mmiks/U7C+q7exzN+umWo61W1RnQYIMY9JniEJ1B/
	E3akprLkIUabWzXY4f9aMl//wEID1Nx4ISogePK49LF4iIWM4azU2SiDfc2VILRzjdWeZ+QKE2v
	NBCcqkq1k1/31AUKzWFFO9xRLV+1rKtXXXwrRTqstTkDqF6alFTuCZdtJEgKq/nxLQN5ZJkTzw7
	g8uv+s2D7eD1rhK/hnP8akk6quYbGRN9E3VR7o+nItCdmmCcg0P494Rf4pKLsTq4JmQ2B0ur38x
	5A9Xi5rsfw==
X-Google-Smtp-Source: AGHT+IFiDzVT+2dmKCxs79HazquRaVoEKj9U/SHZ9ROcZSGxvoksUVUV31FTbP+B8I3rHTQWDxtOGVKUAq/NVn1bvko=
X-Received: by 2002:a17:903:1aa8:b0:272:a900:c42e with SMTP id
 d9443c01a7336-28e9a693ea9mr80467765ad.35.1759608013223; Sat, 04 Oct 2025
 13:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250927125006.824293-1-christianshewitt@gmail.com> <20250927125006.824293-2-christianshewitt@gmail.com>
In-Reply-To: <20250927125006.824293-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 22:00:02 +0200
X-Gm-Features: AS18NWBM_Q13VsV8nrfsb2laKCZ_aAXl7OeFBFEiWoHsvMuxISq6Y9mZ9LHfpAE
Message-ID: <CAFBinCBeN-wjn-LBpgX9N_evzF1gL0nU8DPk5GSC28_s+tX+AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix
 TX9 Pro
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_130014_136181_000B33D1 
X-CRM114-Status: GOOD (  12.24  )
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

T24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMjo1MOKAr1BNIENocmlzdGlhbiBIZXdpdHQKPGNocmlz
dGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKPgo+IE9yYW50aCBUYW5peCBUWDkgUHJvIGlz
IGJhc2VkIG9uIHRoZSBBbWxvZ2ljIFEyMDAgcmVmZXJlbmNlIGRlc2lnbiB3aXRoCj4gYW4gUzkx
MiBjaGlwIGFuZCB0aGUgZm9sbG93aW5nIHNwZWNzOgo+Cj4gLSAzR0IgRERSMyBSQU0KPiAtIDMy
R0IgZU1NQwo+IC0gMTAvMTAwLzEwMDAgQmFzZS1UIEV0aGVybmV0Cj4gLSBBUDYzNTYgV2lyZWxl
c3MgKDgwMi4xMSBiL2cvbi9hYywgQlQgNS4wKQo+IC0gSERNSSAyLjBhIHZpZGVvCj4gLSBWRkQg
Zm9yIGNsb2NrL3N0YXR1cwo+IC0gMnggVVNCIDIuMCBwb3J0cwo+IC0gSVIgcmVjZWl2ZXIKPiAt
IDF4IFBvd2VyIExFRCAod2hpdGUpCj4gLSAxeCBVcGRhdGUvUmVzZXQgYnV0dG9uICh1bmRlcnNp
ZGUpCj4gLSAxeCBtaWNybyBTRCBjYXJkIHNsb3QKPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCj4gLS0t
Cj4gQ2hlY2twYXRjaCBnZW5lcmF0ZXMgdGhlICdwaHktbW9kZSAicmdtaWkiIHdpdGhvdXQgY29t
bWVudCcKPiB3YXJuaW5nIGJ1dCB0aGlzIGR0cyBpcyB1c2luZyB0aGUgc2FtZSByZ21paSBmb3Jt
YXQgYXMgYWxsCj4gb3RoZXIgQW1sb2dpYyBib2FyZHMsIHNvIEkgaGF2ZSBvbWl0dGVkIGEgY29t
bWVudC4KU28gZmFyIHdlJ3ZlIGJlZW4gbWltaWNraW5nIHRoZSB2ZW5kb3Iga2VybmVsICh3aGlj
aCBzZXRzIHVwIHRoZSBNQUMKdG8gZ2VuZXJhdGUgdGhlIGRlbGF5cyBhbmQgZGlzYWJsZXMgdGhl
bSBvbiBQSFkgbGV2ZWwpLgpJZiB3ZSBjaGFuZ2UgaXQgd2Ugc2hvdWxkIGRvIHNvIGZvciBhbGwg
ZGV2aWNlcy4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
