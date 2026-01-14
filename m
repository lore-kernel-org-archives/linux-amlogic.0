Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307DED31A3C
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZiiSHgObZCax8TfzpPV1leHrKUB97wTjq0+NCl/kts=; b=HwdrisjJ5qjfw0
	NEuzxi7ZIOaY3zKk0S4i8h+m71KSAb3cQh2OF7sKzUzBpcb0HhrTCXwyXkynPxdt5LRDk/dh5sPzS
	XR8lz590l7xHt1aUAQf32GKhm/QTBB4cD6Jnc4r0LVcBd1P+o7PqVDSpnQSMPB/CxushrZJiBdSd6
	8unLPQd8f1GiuLO6i38BmH81BKu629rZqFqiiIESZ++gn/4IOsfg0qF/zhc8YK00WC0Kiz1nZGsXo
	Iaxh0KrbhfkpMBv3rD4El7bS2qzq5rowir4nmWQvWPRgb8nCo4JA7t4Etev2Lx0ADR0jAxenUgbZF
	+vZOAxxJnmbDpe1Q0NrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxma-00000008gZi-1T5N;
	Wed, 14 Jan 2026 10:07:20 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxmX-00000008gWG-1G3d
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 10:07:19 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2ae255ac8bdso4209409eec.0
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 02:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768385236; x=1768990036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQwoLslnjX1W0FyM8XHVf4CZqHjqzYWMX1mzng2p1Bk=;
        b=NYf/Npg1a42LRfLE3OJ6qs29x+bX3SCD+9FA8yUdfY/p0ciFDG4ZBV4SmUXcIMXzEv
         zmivPSeRBK406Cwi2XQ00Sppw53tIpJbiOoLII0GeNv1sMzbTRpeGzqqGotjn1+yjXGK
         lpG2YB0cpW26g5RZJFKJfsGBhD/e39LojI7b74hX93yZ8mXfX4WpEi7UG0ytL0Z0hiuZ
         Z6K8JBShmYHIUHCPFXyOg8SbeBoRcdcrgC7c8EtR+ujbB4HZL7qGzma7u1CGT4Jq5BUa
         kJ20WtIiG/KFJiFeGb+q6qr2op6p2aXVmlTHNZ6N+xelukdRrtgOam30J/+Tp290vGpR
         iM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385236; x=1768990036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NQwoLslnjX1W0FyM8XHVf4CZqHjqzYWMX1mzng2p1Bk=;
        b=W4C0y8HGXEV4dpgfCg6wWlicqiL9o8gtQDCfJhtgqUVQHsA35d5gHveOybJ7awIyGh
         xLhioUKWlnM3MNQLYBlywH/rq1v7gs/PkGjyIcnGbxhLIGIsn43QSxYqkDMbkT/YOHJW
         My7L8m46ElBw6MMUa/D5dpetb3PqpAASpHeNqQvVakwqUcRJT83k5retjKE7msKTvPHc
         i9/6iD+TeRGyIeI+jN/0xVqw9qbUTboag+G2hK+sq12Un3cwMvElBLlmwQRWW45GNm5b
         cYHpLU4L+l+WDQNfj1P1c5AJRRWoVZtGUO3aXkC3mqmlc9W0lYRYJlIZWjiPwlGkDAZs
         B3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXQOMNjnk2njHL8v3etFM9GfWWKDQQJfPPvxGCfOdC4eV6MZeJ1Q3jHNfnkj617wS2oF/IU7JyXgV96cal@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2KQlgcS6/AkYZfiqf5Lsiol5PwS5SG7I4zOPY7OHJkONqIDS2
	fsrxPK7jbD27//vu3q7G/Rbbtjd9Ca4Rd496XRx5JocIHkk0c8QuAwgh/aA5kZUPpV1Swb6869o
	SNbvMmcJZg+zAzxo40usHMmlhRRa2oxc=
X-Gm-Gg: AY/fxX5opwYFsIMjD22yTYTtQxXK8a8Q7TxmPjGVB0TOGSSlqw45WEFhq5JITJ6ynQH
	dz29GPDTBWC4X+sD31DPDXYqEJgrHGWmk2X1i3g2zPNy+03T+tCrM2AmJ6a0lgMWV8NbyZt7x8M
	+aTVg8q3iPoQXZVgD4bq6OnWoMRS/w7/ftKlYjd4Kr8S6u/a0S8UU7UIZMVU8Armc0MrZZP6rqM
	ikSRA3wYUtxzEFvSbyDiUv/KPVYx3EQ83mYoKJTQHtM8YMs3wilWLtBLXcGfs0Iav7kSF/l
X-Received: by 2002:a05:7301:6583:b0:2ab:ca55:b763 with SMTP id
 5a478bee46e88-2b48f70baefmr2178644eec.42.1768385236327; Wed, 14 Jan 2026
 02:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20260114062549.68954-1-nick@khadas.com> <20260114062549.68954-2-nick@khadas.com>
 <20260114-slick-passionate-mink-216a3a@quoll>
In-Reply-To: <20260114-slick-passionate-mink-216a3a@quoll>
From: Nick Xie <xieqinick@gmail.com>
Date: Wed, 14 Jan 2026 18:07:05 +0800
X-Gm-Features: AZwV_QjSdpwi2V3tZNa-BESE2_IXXSE5rUYX5Df18jOqnSGHXgYKZ2hDVq57tOo
Message-ID: <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S binding
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020717_343845_4C52E4DF 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com, khilman@baylibre.com, linux-kernel@vger.kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiDkuo4yMDI25bm0MeaciDE05pel
5ZGo5LiJIDE2OjUx5YaZ6YGT77yaCj4KPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCAwMjoyNTo0
OFBNICswODAwLCBOaWNrIFhpZSB3cm90ZToKPiA+IEFkZCBkZXZpY2V0cmVlIGJpbmRpbmcgZm9y
IEtoYWRhcyBWSU0xUyBib2FyZCBiYXNlZCBvbgo+ID4gQW1sb2dpYyBTNCBTOTA1WTQgU29DLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgWGllIDxuaWNrQGtoYWRhcy5jb20+Cj4KPiBZb3Ug
c3RpbGwgaGF2ZSB0aGUgc2FtZSBGcm9tL1NvQiBtaXNtYXRjaC4KCk9LLCAgSSB3aWxsIGZpeCBp
dCBpbiBuZXh0IHZlcnNpb24uCgo+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCj4gPiBpbmRleCAwOGQ5OTYzZmU5MjU5Li41
NTY2M2UwZjdmOTE1IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCj4gPiBAQCAtMjQ3LDYgKzI0NywxMiBAQCBwcm9w
ZXJ0aWVzOgo+ID4gICAgICAgICAgICAgICAgLSBhbWxvZ2ljLGFxMjIyCj4gPiAgICAgICAgICAg
IC0gY29uc3Q6IGFtbG9naWMsczQKPiA+Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogQm9hcmRz
IHdpdGggdGhlIEFtbG9naWMgTWVzb24gUzQgUzkwNVk0IFNvQwo+ID4gKyAgICAgICAgaXRlbXM6
Cj4gPiArICAgICAgICAgIC0gZW51bToKPgo+IFlvcHUgYWxyZWFkeSBoYXZlIGV4YWN0bHkgc3Vj
aCBlbnVtIHdpdGggc3VjaCBkZXNjcmlwdGlvbiwgc28geW91cgo+IGNvbXBhdGlibGUgZ29lcyB0
aGVyZS4gTG9vayAtIGl0IGlzIGNhbGxlZCAiQm9hcmRzIiAtIHBsdXJhbC4KClRoZSBleGlzdCBi
b2FyZCBhcTIyMiBpcyBiYXNlZCBvbiBTb0MgUzkwNVgyLCBidXQgdGhlIG5ldyBib2FyZCB2aW0x
cwppcyBiYWVkIG9uIFM5MDVZNCwKdGhleSBhcmUgZGlmZmVyZW50IFNvQywgc28gd2UgbmVlZCB0
byBwdXQgUzkwNVk0IHVuZGVyIFM4MDVYMiA/Cgo+Cj4gPiArICAgICAgICAgICAgICAtIGtoYWRh
cyx2aW0xcwo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHM0Cj4KPiBCZXN0IHJlZ2Fy
ZHMsCj4gS3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
