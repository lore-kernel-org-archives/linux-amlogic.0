Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB903CA9ECA
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfL25b93THF4mWEktvPQxeBiIzV3NldvpTvMWrGmuPc=; b=VYw7NAd74v0wNQ
	bKBEk7UOEQej/vikwtCSXHW+Xx2ud/dQ2tZAzZJb0gpN9qNQyvyMTOEiJJ3yTv7xZ6TUT9dL2OAMC
	AwSYoc+Sr2rR23liF21TPRCToBBF4K5DQYu+zGBtJOvofimPg6v9ikj33//I7kLVWWH81Op2QOMhm
	AYQeGY67bXUz1Mhrr2NsU1kKoPDftMc3zRx3Q+l8c2yqAHVHwc0vfvSM9msPbH0z+5r4fpin3s7d2
	XjMtiRDQA5DbRQUs3rH/PqCSemUvqMb+66/DEWzSqRIFftwdQqhS7S3QH+6UNq/61msW2DIRnTHxd
	rYdG+Xh19jlx9toS1XRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfh2-00000008VA2-05Sh;
	Sat, 10 Oct 2026 22:37:30 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfgz-00000008V9J-0SZQ
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 22:37:26 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-6768403e9bbso543964d50.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 15:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791671844; cv=none;
        d=google.com; s=arc-20260327;
        b=KX5md9za/nKE4fjxF5TKgF+/Cqe7ON5FbIhvcHCZzBLjAZL/w+JYUtqIdrp39rTvn8
         iBwYpl6jgw4cOfQdzGqe+GLMQiRkslU9f40PKHk2Std1Wpsgo+tRMQ5k6nK1ee4tsCko
         R9HKBcioieOj5HrMtwpTF2WWTF84Nx5OZV5wthc58YYOwJLgtdT0WNbdM0TaGxmeS5Dq
         GrSmqpvWceiU8FPgwZWgmIAIjnyh9hIZoVquu8aHHDiRuheVSJexFms8ItIsPtCtCZ4C
         tkUj4ZmI6FyFpftOEqvLoyWkQ40wH2crrDHAmRV1Adqi9dTLqN/2C/8tY4Weo/iWivS5
         /01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        fh=3xoRNMURTFbCRRUqOwP4BfRF7Ud2+qjsdEGA86yQ10I=;
        b=CeXDvogLgef4VrToZBGv+uMRVS3qgiksyWIeKDRFQaJp6avLCmFb6AcVz2veib/1Fx
         SEkCxsIcZNBv7whS/9Rp9nv8rXyFWHuwoMUNO6f6GdLw4+V+esQuOUBSSw4iNMajDGbE
         g8Lnap7Pf0bi68yrvWs+uto7dh265nkQxutcsEQBXljznI1NH88ovPQrClAdSGdcbfH0
         CeeVEWKTAvuWSwb+b8hVMKooemX0Bz5nEE8ES+SQrfgQKX4y4oxuA5IJTfZsYbfxqYTV
         9Zpwys4WHmC/eg5zwIYggTQmLZE8zOdiuejTWo+ewk+1Xat48pQjnzbJgzt75MmFG/ay
         Umuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791671844; x=1792276644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        b=mHYPcbl0XZRh06wqy1ZFYQREy299ltK7h6KvSsbrlCKPoDYXhyaPgXsnMaZoVGux5s
         ZdtKoWQQBHJ9WZ1wrnTgRccttGh/F92YdSq8JmAcAHRNIKbFoaNs1MhT7yPHQzwNzP2h
         q0ZqLu8TizR8ggbcx5z5ZSYTHFvOz6/nxP5yEpTnzhauTAN0MaxZVYe54UErtWUVlsbD
         0dk1zsuCoLjaa5WdJpVeOB0gcj/QzHHyKodUUazYNLXHjohjPJS8KRCABRXejMlQprYK
         /tqdLmvwgH3VIr1lui0BeFWsK2CGeRHpv8cS+arnoJP/pjWvtxoLtoGBp/k/KarddhDL
         OCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791671844; x=1792276644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        b=zLzwviZAuAs7w1KSjR3AlGKLb8CUndFU77aEzn/XCP0Oe2CLwSu/WPltB+L3wyKwy+
         /E+6mdC2wOE0oVj9iG/oScFJiYCpzXV+ddCFdgcbZsyGapbuLuq4p9cm0tym5rOPKkuu
         AdhtcaDXWaGTvEDR3a0Qd5cq/UcoqAGiTY9/iJc/1UIPDzbbPKnqA6YrJtpel3PgPWZV
         X+DIyCUDzxG98StDmHcZdz6HKw6iBmRkkxvQMIPdl/4qfPqBpkVClgB2yqvXt3BVdE4u
         tw7MRj9Im1cDFAs1VFcdz5v886EqgYzOyUof3CmzbuE2PL6/oXRByywN19EOUMEInCbu
         Vu6A==
X-Forwarded-Encrypted: i=1; AKwUvBz6MNlrNfIn2SobxWDZQD9zdOANy2eUYZLKdO66drX1wyXhxtPvEtIQVWrfgzKbYfHdNscPj/3d3/cTDU39@lists.infradead.org
X-Gm-Message-State: AFq9FYIHxHikOhhCNLlC+rJ4q+syb7taNfEIKn4wN22OPArhSX9VU7ea
	Ux9GV+PPfxxmCPqeyRZf/m+I8gDYS7lIj7FaMdrI2LO4XSQ7ihSiYiZW6YAkjyXJGVQ5wAHckSs
	LLZZ3EzzzjYxIBelJzpJHWwE5kbrTq1g=
X-Gm-Gg: AYBFou3SmFszNF6KNBPTWq/jR9p4bgnBmwct0j+ewhNEfWxxgzsporEgwQhXIvwxldo
	KyvYmzfGCUaS7qwbht4xVZYGq90NhrsXOBT11Z9fJGuODSgo4ye7EbEH+8ClneIW8kN6sManrr6
	HaIk/cqD3bDNSREbjJsVYXrHMBS0CzTWh9mkuyfLuCIxv27mPB/u/2+q6pWWhwFYZQ8ZzMiccIv
	VKywv82zRyJOU9+kVuJnLnoCpVryutcfx3R/ordNvyiSfUVO6w1Nk1OBPH29an/0AE8HOdIOogh
	wYTB1qDH++4kzkk5tX3oql4rioH2hroyPKhdamPcIFgdj1+fXraja0rGoXjPYo+uB4auA4V8gei
	eT5b/MnbMTDRu
X-Received: by 2002:a05:690e:4813:b0:677:c63c:ed3f with SMTP id
 956f58d0204a3-67936a45e25mr1411453d50.69.1791671843883; Sat, 10 Oct 2026
 15:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-9-tanure@linux.com>
In-Reply-To: <20261010105900.247342-9-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:37:13 +0200
X-Gm-Features: AclHuK83tYlY1Yg4pW9pjFmYK85k4ljD0olzP_yaTJsbdkiweyuLFexiO6_OaD4
Message-ID: <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_153725_155201_8EB07FB5 
X-CRM114-Status: GOOD (  11.83  )
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

SGkgQW5kcmV3LCBIaSBMdWNhcywKCk9uIFNhdCwgT2N0IDEwLCAyMDI2IGF0IDEyOjU54oCvUE0g
THVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPiB3cm90ZToKWy4uLl0KPiArIyAgIHBoeS1t
b2RlICAgIHR4LWludGVybmFsLWRlbGF5LXBzICByeC1pbnRlcm5hbC1kZWxheS1wcyAgVFggZGVs
YXkgICAgUlggZGVsYXkKPiArIyAgIHJnbWlpICAgICAgIC0gICAgICAgICAgICAgICAgICAgICAt
ICAgICAgICAgICAgICAgICAgICAgUENCIHRyYWNlICAgUENCIHRyYWNlCj4gKyMgICByZ21paS1p
ZCAgICAtICAgICAgICAgICAgICAgICAgICAgLSAgICAgICAgICAgICAgICAgICAgIFBIWSAgICAg
ICAgIFBIWQo+ICsjICAgcmdtaWktaWQgICAgcHJlc2VudCAgICAgICAgICAgICAgIC0gICAgICAg
ICAgICAgICAgICAgICBNQUMgICAgICAgICBQSFkKPiArIyAgIHJnbWlpLWlkICAgIC0gICAgICAg
ICAgICAgICAgICAgICBwcmVzZW50ICAgICAgICAgICAgICAgUEhZICAgICAgICAgTUFDCj4gKyMg
ICByZ21paS1pZCAgICBwcmVzZW50ICAgICAgICAgICAgICAgcHJlc2VudCAgICAgICAgICAgICAg
IE1BQyAgICAgICAgIE1BQwo+ICsjICAgcmdtaWktdHhpZCAgLSAgICAgICAgICAgICAgICAgICAg
IC0gICAgICAgICAgICAgICAgICAgICBQSFkgICAgICAgICBQQ0IgdHJhY2UKPiArIyAgIHJnbWlp
LXR4aWQgIHByZXNlbnQgICAgICAgICAgICAgICAtICAgICAgICAgICAgICAgICAgICAgTUFDICAg
ICAgICAgUENCIHRyYWNlCj4gKyMgICByZ21paS1yeGlkICAtICAgICAgICAgICAgICAgICAgICAg
LSAgICAgICAgICAgICAgICAgICAgIFBDQiB0cmFjZSAgIFBIWQo+ICsjICAgcmdtaWktcnhpZCAg
LSAgICAgICAgICAgICAgICAgICAgIHByZXNlbnQgICAgICAgICAgICAgICBQQ0IgdHJhY2UgICBN
QUMKV2UgaGF2ZSBzb21lIGJvYXJkcyB3aGVyZSB0aGUgUENCIHRyYWNlcyByZXN1bHQgaW4gcGFy
dCAoMTIwMHBzKSBvZgp0aGUgZGVsYXkgbmVlZGVkIGZvciBSR01JSSAoMjAwMHBzKS4KVGhlIHJl
bWFpbmRlciAoODAwcHMpIGhhcyB0byBiZSBhZGRlZCBieSBlaXRoZXIgUEhZIG9yIE1BQzogdGhl
CihSVEw4MjExRikgUEhZIGNhbiBvbmx5IGdlbmVyYXRlIDAgb3IgMjAwMHBzIGRlbGF5IHNvIHRo
ZSBNQUMgaGFzIHRvCnRha2Ugb3Zlci4KRm9yIHRoZSB0aHJlZSBib2FyZHMgSSBoYXZlIGluIG1p
bmQsIHBsZWFzZSBzZWUgJCBnaXQgZ3JlcApyeC1pbnRlcm5hbC1kZWxheS1wcyBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvCgo+ICsjIEEgcHJvcGVydHkgZm9yIGEgY2xvY2sgdGhlIFBDQiBh
bHJlYWR5IGRlbGF5cyBpcyBub3QgaW4gdGhpcyB0YWJsZS4KQ2FuIHlvdSBwbGVhc2UgZXhwbGFp
biB0aGlzIHNlbnRlbmNlIChJJ20gbm90IGEgbmF0aXZlIEVuZ2xpc2ggc3BlYWtlcik/CkhvdyBJ
IGludGVycHJldCB0aGUgc2VudGVuY2U6IFRoZSBQQ0IgbWF5IGFkZCBkZWxheXMgYnV0IHRob3Nl
IGFyZQppbXBsaWNpdCBhbmQgbm90IHBhcnQgb2YgdGhlIHtyeCx0eH0taW50ZXJuYWwtZGVsYXkt
cHMgcHJvcGVydGllcy4gSWYKdGhlIGRlbGF5cyBhZGRlZCBieSB0aGUgUENCIGRvbid0IGNvdmVy
IHRoZSBmdWxsIDJucyByZXF1aXJlbWVudCB0aGVuCmVpdGhlciBNQUMgb3IgUEhZIG5lZWQgdG8g
YWRkIHRoZSByZW1haW5kZXIsIHNlZSBmaW5lLXR1bmluZyBiZWxvdy4KCj4gKyMgSXQgaXMgZWl0
aGVyIHRoZSBmaW5lIHR1bmluZyBkZXNjcmliZWQgbmV4dCwgb3IgYSBtaXN0YWtlIHRoZSBNQUMK
PiArIyBzaG91bGQgcmVwb3J0IGFzIGEgZmF0YWwgZXJyb3IuCkhvdyBjYW4gSSBkaWZmZXJlbnRp
YXRlIGJldHdlZW4gImZpbmUgdHVuaW5nIiBhbmQgIm1pc3Rha2UiPwoKCkJlc3QgcmVnYXJkcywK
TWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
