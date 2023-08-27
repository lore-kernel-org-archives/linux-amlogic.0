Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAE2C83F01
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Aug 2023 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oThkerO0DV7SN/4cwcRYK9IoYWIyU+NGJufjVctdWiE=; b=haas8PkvOtY/9J
	krCLlMDDiO43rXMsEU+jOs91Q0V4uAHQv9Hh9GTIML7id9sryM3KH5NKFEduoT69KvUeyQ787tjTZ
	hsyOhzntkc7svriSgonhQrmvuRPwmLi1Nm/ntcT66mkEBMD1H81M+IrragPI40kGrkLdbBNniMf2f
	bA8cDwuiP/8GGYAzf19VDJL1RLB2e7E6qaXmhXLLBUtBcuvVMKyIEjDaX4Pllnrb1nh0aezYt/4cz
	9qMZEcYFEgWWowQPutFWmDkZTAtqPf+/VOexitEXXKp7lDdeKIJLRcj7X9q0Isod81mw6Lyj8ooE1
	jceAN4rfgZerCCpJ/mCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCNw-007lmX-2Y;
	Sun, 27 Aug 2023 09:48:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCNt-007liQ-2D
	for linux-amlogic@lists.infradead.org;
	Sun, 27 Aug 2023 09:48:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-313e742a787so1409183f8f.1
        for <linux-amlogic@lists.infradead.org>; Sun, 27 Aug 2023 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693129719; x=1693734519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJNNVgrRVQL7c5pbhPjz9Gf5Pj28bPWzD3qJ9aTL+/s=;
        b=JzIlOcyLne6Uoo2jYZndhS99aWgxnSff5fBa6kvwc/CnQz5B6DeXLELiqhd7D+tOqf
         AR/ZoyMGc5CYHTUPKwWm69Z6A/IdGW3xJcWXRVHvtxp5HrfWTdraak9BiK/YmsuX7gUY
         b7z2q6qQh60Nsk/W8SzTGKa9CR4Aqdri714oDGMNyxNyvF4puSUawnmWrOfbUdR04hGn
         si0bJ64ZEKavhgn+l3VV/V8qDkLcpeHGl5wLJXT3emNQKd9Zv74Ynzp6Emh5C2UhAHhC
         drz9BQJ6je4pZenQGLharWJVEonrjSYxmKuPCSywhNtutE/U+tnxQtG4VJCSBS+g7jV4
         UyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693129719; x=1693734519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJNNVgrRVQL7c5pbhPjz9Gf5Pj28bPWzD3qJ9aTL+/s=;
        b=Wu5K7OED8wr1MlGk4Bk9K6BySTZD5aFvfHLK08dP5u+9MW/Vmcuv9ghpT0MZokhSMW
         9wlXIq6xxIUJt/FHaCFJk4RzJiQ3wKi7EIL90yKsRgB1xQhKUKXkozZtej+VR/314YTZ
         SUKVhWje0ZiKyoo+ohMJlVzTe1WV2aOZnALiObC8uW/hpY0Q0d5wlnB7LoYffTp85BmA
         aH+5ez1L2NwSU4o5LyyhsvWfLYxpOf7cGgDaSVOTioYIkP2m3BkpKQAwFPgh6QGwbOgg
         6J4RXF2o9WL/KilUO5ytKHWiX85PY4MNdP1oHxeGG+QtpwuVwCniyM20ALrb0LkT93S9
         f8eQ==
X-Gm-Message-State: AOJu0Yw8in+6LvLJtSwgwclV4X4nXAevusTQD8R6T5FEOJCpG9zR6wDs
	FlafHmIockaxun910AQIONtATQ==
X-Google-Smtp-Source: AGHT+IFyYSVmg96H/v92sjJ+IDfGQO6CLmaJ2hV7K5fhbi7+XHiRFVoEDfb2YLomtTbo92BK2A9i8g==
X-Received: by 2002:a5d:4ac2:0:b0:319:70c8:6e90 with SMTP id y2-20020a5d4ac2000000b0031970c86e90mr16793479wrs.24.1693129718694;
        Sun, 27 Aug 2023 02:48:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8865:2133:756f:b886? ([2a01:e0a:982:cbb0:8865:2133:756f:b886])
        by smtp.gmail.com with ESMTPSA id b7-20020a05600c11c700b003fbb25da65bsm7343975wmi.30.2023.08.27.02.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 02:48:38 -0700 (PDT)
Message-ID: <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
Date: Sun, 27 Aug 2023 11:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Content-Language: en-GB
To: Lucas Tanure <tanure@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230827082944.5100-1-tanure@linux.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230827082944.5100-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_024841_722331_BD0C41B4 
X-CRM114-Status: GOOD (  12.55  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTHVjYXMsCgpMZSAyNy8wOC8yMDIzIMOgIDEwOjI5LCBMdWNhcyBUYW51cmUgYSDDqWNyaXTC
oDoKPiBUaGlzIHJldmVydHMgY29tbWl0IDZhNDE5N2Y5NzYzMzI1MDQzYWJmNzY5MGEyMTEyNGE5
ZmFjYmY1MmUuCj4gTmV3IFNvQyB3aWxsIHVzZSB0dHlTMCBpbnN0ZWFkIG9mIHR0eUFNTCwgc28g
VDcgU29DIGRvZXNuJ3QgbmVlZCBhIE9GX0VBUkxZQ09OX0RFQ0xBUkUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+IC0tLQo+IFNpbmNlIFYxOgo+
IC0gYWRkIFNpZ25lZC1vZmYtYnk6Cj4gCj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFy
dC5jIHwgMiAtLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJp
YWwvbWVzb25fdWFydC5jCj4gaW5kZXggYzRmNjFkODJmYjcyNy4uNzkwZDkxMGRhZmE1ZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gKysrIGIvZHJpdmVy
cy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+IEBAIC02NDgsOCArNjQ4LDYgQEAgbWVzb25fc2Vy
aWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXAoc3RydWN0IGVhcmx5Y29uX2RldmljZSAqZGV2aWNlLCBj
b25zdCBjaGFyICpvcHQKPiAgIAo+ICAgT0ZfRUFSTFlDT05fREVDTEFSRShtZXNvbiwgImFtbG9n
aWMsbWVzb24tYW8tdWFydCIsCj4gICAJCSAgICBtZXNvbl9zZXJpYWxfZWFybHlfY29uc29sZV9z
ZXR1cCk7Cj4gLU9GX0VBUkxZQ09OX0RFQ0xBUkUobWVzb24sICJhbWxvZ2ljLHQ3LXVhcnQiLAo+
IC0JCSAgICBtZXNvbl9zZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cCk7Cj4gICAKPiAgICNkZWZp
bmUgTUVTT05fU0VSSUFMX0NPTlNPTEVfUFRSKF9kZXZuYW1lKSAoJm1lc29uX3NlcmlhbF9jb25z
b2xlXyMjX2Rldm5hbWUpCj4gICAjZWxzZQoKSG93IGRvIHlvdSB1c2UgZWFybHljb24gd2l0aCB0
aGlzIHJlbW92ZWQgPwoKTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
