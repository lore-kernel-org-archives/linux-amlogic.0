Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73ECEB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jun 2023 16:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOhba0OSvKW7ljz2OkSRCeQz9jjW1UYoqjhSvbDSIYY=; b=wQiPKDyd3x2FEN
	07dIYKbUHF+KDRJT6fwSUJfEQk4ab9PXEuY5maxb2LOPH4MDMpqdbQL494gCP8UEbqQ+Rg07O53lE
	sevcRsmOH8g6SCzmnCnisNHqWiWVAFZzcz0ecl7iRZjWCs5t42qKR7cpYygtLT2RflUBYHLkPAeSI
	0o7hvakVPIhh5Njk/PLMFp7I3q4WD2sIy3rkyRCXeOSTb36J+GPYe99TngVyF4o/dGlsTMCvUjXR/
	UsN96Kk/jLs6lsvgNG1bl9tt47J2qCiAR/TwQAcW57PNv2eNH4RXZdI8Unb+GWDwyqqikiV+6EeLq
	cTWonBX33g3lx7IS9Tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuaZ-001XfV-2x;
	Thu, 29 Jun 2023 16:33:47 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuaW-001Xe0-1A;
	Thu, 29 Jun 2023 16:33:45 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5704ddda6dfso8581527b3.1;
        Thu, 29 Jun 2023 09:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688056421; x=1690648421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxwLFy9k5SNI8Gdm+Tnj9m12doV32P23RU600L8QjFM=;
        b=TY8GOixu1yzbCIMR22bNtOzVKQ60I0X4hwgU18nEVouDtUUvUqALb3GzUFK+DPFS1F
         4762IuMbxjYLsy5llSqVqVByAya2y+4oYl1XMFkW8ogz8F/yfzV4ynQnJRb4uFS+6erh
         65XW1VwA9Rt6d35TLyXDvaY5kH2KQMB7SA711sO6qALYpSh1+BT42FL5D5om5Wl13Ypl
         0IADvASDSfIEW43EQ6mIlAwlqvGJEobSUa2rm9AK6cud4RHsOf+keZK0LliI+CfRCybz
         kJz4RtLA38oIga0YqZFtVrWPb2gy6BF8t09cuqeIk/NHQcsze2hdJuz+bVyc17HbPstk
         W+UQ==
X-Gm-Message-State: ABy/qLbbyGMZNSc/frAs5hPznxP/izgV+Zfmdzh0oEKYOAS78PDXf03Q
	4ZbJ8VqQeR1q+EGC4nVtSQaqiGsAwp7s/7aj
X-Google-Smtp-Source: APBJJlEFDdiRRjXTfQ0RXvhDRAJ5LpQAbNOdkGQVIKhiGOGL4Z3K2GuwMMY3d/DOE4V0yZmZ714zBA==
X-Received: by 2002:a0d:d549:0:b0:577:1909:ee16 with SMTP id x70-20020a0dd549000000b005771909ee16mr4169227ywd.30.1688056421624;
        Thu, 29 Jun 2023 09:33:41 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id z134-20020a0dd78c000000b005771872a8dbsm686079ywd.132.2023.06.29.09.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 09:33:41 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bc379e4c1cbso792775276.2;
        Thu, 29 Jun 2023 09:33:40 -0700 (PDT)
X-Received: by 2002:a25:3252:0:b0:c1a:bff5:377d with SMTP id
 y79-20020a253252000000b00c1abff5377dmr299680yby.64.1688056420537; Thu, 29 Jun
 2023 09:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626-viewless-marrow-17838c2172f6@wendy> <676db602-54d8-d6b0-274f-365e65a2102c@amlogic.com>
 <20230627-unsure-uniformly-079cad2c26e6@wendy> <061bb829-fb75-d154-0c15-9f0f982fec41@amlogic.com>
In-Reply-To: <061bb829-fb75-d154-0c15-9f0f982fec41@amlogic.com>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 29 Jun 2023 17:33:29 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0Kf3zFyUtkCEkm7K8zXwaovxQmo1DWFwy8y25GQ2wqXg@mail.gmail.com>
Message-ID: <CAJX_Q+0Kf3zFyUtkCEkm7K8zXwaovxQmo1DWFwy8y25GQ2wqXg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Baisc devicetree support for Amlogic T7
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_093344_400559_76265FAA 
X-CRM114-Status: GOOD (  25.63  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgODo1MuKAr0FNIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPiB3cm90ZToKPgo+Cj4gT24gMjAyMy82LzI3IDE1OjIzLCBDb25vciBE
b29sZXkgd3JvdGU6Cj4KPgo+ICA+IFsgRVhURVJOQUwgRU1BSUwgXQo+ICA+Cj4gID4gT24gVHVl
LCBKdW4gMjcsIDIwMjMgYXQgMDI6MTM6MzRQTSArMDgwMCwgWGlhbndlaSBaaGFvIHdyb3RlOgo+
ICA+PiBIaSBDb25vciwKPiAgPj4gICAgICBUaGFua3MgZm9yIHlvdSByZXBseS4KPiAgPj4gT24g
MjAyMy82LzI2IDE4OjAyLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gID4+Cj4gID4+Cj4gID4+PiBb
IEVYVEVSTkFMIEVNQUlMIF0KPiAgPj4+Cj4gID4+PiBIZXksCj4gID4+Pgo+ICA+Pj4gT24gTW9u
LCBKdW4gMjYsIDIwMjMgYXQgMDU6NTI6MjFQTSArMDgwMCwgWGlhbndlaSBaaGFvIHdyb3RlOgo+
ICA+Pj4+IFQ3IGlzIGFuIGFkdmFuY2VkIGFwcGxpY2F0aW9uIHByb2Nlc3NvciBkZXNpZ25lZCBm
b3Igc21hcnQgZGlzcGxheS4KPiAgPj4+Pgo+ICA+Pj4+IEFkZCB0aGUgbmV3IFQ3IFNvQy9ib2Fy
ZCBkZXZpY2UgdHJlZSBiaW5kaW5ncy4KPiAgPj4+Pgo+ICA+Pj4+IEFkZCBiYXNpYyBzdXBwb3J0
IGZvciB0aGUgVDcgYmFzZWQgQW1sb2dpYyBBTjQwMCBib2FyZCwgd2hpY2gKPiAgPj4+PiBkZXNj
cmliZXN0aGUgZm9sbG93aW5nIGNvbXBvbmVudHM6IENQVSwgR0lDLCBJUlEsIFRpbWVyLCBVQVJU
LiBJdCdzCj4gID4+Pj4gY2FwYWJsZSBvZiBib290aW5nIHVwIGludG8gdGhlIHNlcmlhbCBjb25z
b2xlLgo+ICA+Pj4KPiAgPj4+IEx1Y2FzIGhhcyBhbHJlYWR5IHNlbnQgcGF0Y2hlcyBmb3IgdGhl
IFQ3IFNvQyAmIGlzIGF0IHY1Ogo+ICA+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZGV2aWNldHJlZS8yMDIzMDYyMzA4MTI0Mi4xMDkxMzEtMS0KPiAgPj4+IHRhbnVyZUBsaW51eC5j
b20vCj4gID4+PiBUaGVyZSdzIGJlZW4gYSBiaXQgb2YgZGlzY3Vzc2lvbiB0aGVyZSwgYW5kIHRo
ZXJlIHNlcmlhbCBzdHVmZiBpbgo+ICA+Pj4gcGFydGljdWxhciBpcyBkaWZmZXJlbnQgaW4gaGlz
IHNlcmllcyAoaXQgZG9lc24ndCB1c2UgYWx3YXlzLW9uIGZvcgo+ICA+Pj4gZXhhbXBsZXMpLgo+
ICA+Pj4gQ291bGQgeW91IHBsZWFzZSBnbyBhbmQgdGFrZSBhIGxvb2sgYXQgaGlzIHNlcmllcz8K
PiAgPj4+Cj4gID4+PiBDaGVlcnMsCj4gID4+PiBDb25vci4KPiAgPj4+Cj4gID4+IEFONDAwIGlz
IHRoZSByZWZlcmVuY2UgYm9hcmQgZGVzaWduZWQgYnkgQW1sb2dpYywgd2hpY2ggaXMgZGlmZmVy
ZW50Cj4gID4+IGZyb20gS2hhZGFzIFZJTTQuCj4gID4KPiAgPiBZZXQgeW91IHNoYXJlIHRoZSBz
YW1lIGR0c2ksIHdoaWNoIGhlIGhhcyBnb3QgdGhyb3VnaCBzZXZlcmFsCj4gID4gaXRlcmF0aW9u
cyBvZiBiZWZvcmUgeW91IGFycml2ZWQuCj4gID4KPiBIaSBMdWNhcywKPiBBcmUgeW91IGdvaW5n
IHRvIGNvbnRpbnVlIHdpdGggdGhlIGR0c2kgcGFydD8KPgo+ICA+PiBBbmQgVDcgc2VyaWFsIGlz
IHRoZSBzYW1lIGFzIFM0LCBzbyBJIGZvbGxvdyBTNCBzZXJpYWwuCj4gID4KPiAgPiBZZWFoLCBu
by4gU29DIHNwZWNpZmljIGNvbXBhdGlibGUgcGxlYXNlLgo+ICA+Cj4gID4KPiAgPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ICA+IGxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0Cj4gID4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4g
ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCgpIaSBYaWFud2VpLAoKSSBhbSBkb2luZyB0aGUgYmFzaWNzIGZvciBBbWxvZ2ljIFQ3IEEz
MTFEMiwgYnV0IHRoZSBuZXh0IHN0ZXAgKCBzZApjYXJkIG9yIGVtbWMsIHNvbWV0aGluZyB0byBi
b290IG9uKSB3b3VsZCBiZSBtb3JlIGRpZmZpY3VsdCBmb3IgbWUKdGhhbiB5b3UuCkFmdGVyIHRo
ZSBmaXJzdCBzZXJpZXMgZm9yIFZpbTQgZ2V0cyBtZXJnZWQsIEkgd2lsbCBzdGFydCB0byB3b3Jr
IG9uCmhvdyB0byBnZXQgc2QgY2FyZHMgd29ya2luZy4KQnV0IGlmIHlvdSBhbHJlYWR5IGhhdmUg
dGhhdCB3b3JraW5nIGZvciB0aGUgQU40MDAgYm9hcmQsIHBsZWFzZSBzZW5kCml0LiBBbmQgSSB3
aWxsIGxvb2sgYXQgdGhhdCB3b3JrIGFuZCB1c2UgaXQgZm9yIFZpbTQuCgpPciwgaWYgeW91IGRv
bid0IGhhdmUgaXQgcmVhZHkgYW5kIHdhbnQgdG8gc2hhcmUgaXQgd2l0aCBtZSwgd2UgY2FuCndv
cmsgdG9nZXRoZXIgb24gdGhlc2UgQTMxMUQyIHBhdGNoZXMuCllvdSB0ZXN0IG9uIEFONDAwLCBh
bmQgSSB0ZXN0IG9uIFZpbTQuCgpUaGFua3MKTHVjYXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
