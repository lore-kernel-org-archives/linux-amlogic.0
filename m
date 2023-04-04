Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE35DC761A6
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwQ1ISjWz18AgsuBa+XDfQCuCZP6c5g/zBvLfr/isrw=; b=KtqbL7fCvdlPEz
	zSZvF7NhNzUGXhfhd2kpTkbEBGeLYsctFqI6uwozeI+8dDM0M4MG+UQiyXmx/V5MmXno4SPrGPyiO
	VaA3MBBtw07X1riNolHfOU1Uq7ouewOpIn3utpPmHv/gZ4yZRbh5cI0LQz6QoLI/I9TwhUrO/Ws51
	7CaXYGk3BNafx9j6EdteZU8lehEaP4MsNQv4ktFmTk7cgMUOxBnit//Tqpn70vzmzmg+6DKq6waZO
	zNNrms5yx6xZ2BpPfRmI2Z++lwurXmE5d5OWt6xgsgplw4cTN4wpTdRTYj7t19PAVWwxvRv8NkN3s
	RgVoWAHZSY5rZKbAPJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjnrC-002s9K-2A;
	Tue, 04 Apr 2023 21:06:22 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjnr9-002s8P-2m
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 21:06:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id t10so135817214edd.12
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Apr 2023 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680642376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arcx44/rPklJ1qmh7rA9Vdi3+RywvGhpDpphg6EORnM=;
        b=Ccab2NpeS8C0+MeeUtmKMI/cuZNkQkSrbAFtokffBE3dnDI5Ksc5eWKAzq22i9Q8bV
         HNyZw96y40IpwjJYmI+zFtEIHn+PsPDE9KM9Slofq/DSGEgBeZjC9tTYS9MVOOvzMrNc
         wNkjsk122taFS3rLDDeUnuCWuDe9p8ycazN4ecpoDCE2nhXrembzSS6FAy/J5QAbJjIZ
         /dHbqid1FhtRQuePalzNKCnTZ6B+OTf5TP2O9jFzuxOQbRuS4mSSNiyhYtFZXJhKFFnk
         jCZ6+i8BWQ7hw6gf8EfJ66YCEPSpTMfAuMh+RHeGQ/51ahfS0i0FuHPmQde8Y7fbt0va
         7VpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680642376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Arcx44/rPklJ1qmh7rA9Vdi3+RywvGhpDpphg6EORnM=;
        b=LqRY71GY30++CQ+LVqbE0VYAz6VGH5gjZvOjmoksPOMr+3BVLtBkgMW8yldVBfYPPu
         c7VspGu7dJbSS5CZKMW7dnUwx0fkIHI8E3SsTjrzNjSVV0lWrkS3KJDS20ey0bwj2XRR
         tzz5fXXj5DO0MMwcoUKP5ToZSZH7VbkoO8YHiKvxedH4JNakXIBv6YKRWZlSrVzCwtNO
         FNSfqtLBP6zsB7Fl9D3E7CyNrGyg0gqFaHu2Bvwfugodma8XCF3qEMFkE4npM0IsIIi2
         mwZlUW84x89yLcIpQfip4qEpmCSt6W7VjsdFGJhi1xsqhjavhEdBXUaU0HsIDzss4jHz
         FJKw==
X-Gm-Message-State: AAQBX9fwXPJwWQDwQNOjD61oSTWhz8gB9pE6MfBuYfTSQW3VTn5XB/Gy
	D/AjmdPhd0sc9at9kbO8VIMLH/KVKQWyQl0tvHY=
X-Google-Smtp-Source: AKy350ZL6yADJcNyt/Y3jhM47kWbMutlYKzJdrUWg4OjIkGTWlwLXJLSOuhPhwYlWtiL4lQew208rajvwfiUnAqyZf8=
X-Received: by 2002:a05:6402:27cd:b0:502:3e65:44f7 with SMTP id
 c13-20020a05640227cd00b005023e6544f7mr423242ede.3.1680642375917; Tue, 04 Apr
 2023 14:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr> <1jh6ue74x9.fsf@starbuckisacylon.baylibre.com>
 <EEE9FD80-C106-4A9B-AA8D-5C151E540CFD@hewittfamily.org.uk> <0bb1e3b3-6823-ddb5-001b-72ee1b63779c@free.fr>
In-Reply-To: <0bb1e3b3-6823-ddb5-001b-72ee1b63779c@free.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 4 Apr 2023 23:06:04 +0200
Message-ID: <CAFBinCA+JOxCGzML-Mohryawrn6Vghd8Ns22=2ZfvWov43aeEg@mail.gmail.com>
Subject: Re: [Performance regression] BCM4359/9 on S905X2
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Christian Hewitt <christian@hewittfamily.org.uk>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, MMC <linux-mmc@vger.kernel.org>, 
	AML <linux-amlogic@lists.infradead.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Pierre-Hugues Husson <phh@phh.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_140619_915767_48D687CB 
X-CRM114-Status: GOOD (  18.78  )
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

SGkgTWFyYywKCk9uIFR1ZSwgQXByIDQsIDIwMjMgYXQgNjowOeKAr1BNIE1hcmMgR29uemFsZXog
PG1hcmMudy5nb256YWxlekBmcmVlLmZyPiB3cm90ZToKWy4uLl0KPiBGb3IgdmVuZG9yLCBjb21t
b24vYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uZzEyYV9zZWkuZHRzaQo+Cj4gICAg
ICAgICAgICAgICAgIGJ1cy13aWR0aCA9IDw0PjsKPiAgICAgICAgICAgICAgICAgY2FwLXNkLWhp
Z2hzcGVlZDsKPiAgICAgICAgICAgICAgICAgY2FwLW1tYy1oaWdoc3BlZWQ7Cj4gICAgICAgICAg
ICAgICAgIG1heC1mcmVxdWVuY3kgPSA8MTAwMDAwMDAwPjsKSSB3b3VsZCBzdGFydCBieSBjb21w
YXJpbmcgdGhlIGJ1cyBtb2RlLiBZb3UgY2FuIGdldCBpdCBmcm9tCi9zeXMva2VybmVsL2RlYnVn
L21tYzIvaW9zCk9uIHRoZSB2ZW5kb3Iga2VybmVsIGl0IHNob3VsZCBiZSBpbiAvc3lzL2tlcm5l
bC9kZWJ1Zy9zZGlvL2lvcyAob3IKc2ltaWxhciwgSSdtIHR5cGluZyB0aGlzIGZyb20gdGhlIHRv
cCBvZiBteSBoZWFkKS4KSXQgd2lsbCBnaXZlIHlvdSBpbnNpZ2h0cyBvbiB0aGUgY2xvY2sgYW5k
IHRpbWluZyB0aGF0IGhhcyBiZWVuCm5lZ290aWF0ZWQgYmV0d2VlbiB0aGUgaG9zdCBhbmQgY2Fy
ZC4KCkZyb20gdGhpcyBpbmZvcm1hdGlvbiB5b3UgY2FuIGdldCB0aGUgbWF4aW11bSBidXMgc3Bl
ZWQsIGUuZy4gZnJvbSBbMF0KUGxlYXNlIG5vdGUgdGhhdCBhbnkgY2FyZCB3aWxsIGFkZCBvdmVy
aGVhZCBmb3IgY29tbXVuaWNhdGlvbiwgc28gYnVzCnNwZWVkIHdpbGwgbm90IGJlIGVxdWFsIHRv
IHdpZmkgdGhyb3VnaHB1dC4KCj4gdmVuZG9yIERUUyBoYXMgdGhlIGZvbGxvd2luZyBjaGlsZCBu
b2RlOgo+Cj4gICAgICAgICAgICAgICAgIHNkaW8gewo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHBpbm5hbWUgPSAic2RpbyI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgb2NyX2F2YWlsID0g
PDB4MjAwMDgwPjsgLyoqVkREIHZvbHRhZ2UgMy4zIH4gMy40ICovCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgLyogbWF4X3JlcV9zaXplID0gPDB4MjAwMDA+OyAqLyAvKioxMjhLQiovCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgbWF4X3JlcV9zaXplID0gPDB4NDAwPjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBjYXJkX3R5cGUgPSA8Mz47Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
LyogMzpzZGlvIGRldmljZShpZTpzZGlvLXdpZmkpLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAqIDQ6U0QgY29tYm8gKElPK21lbSkgY2FyZAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAq
Lwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRtb2RlID0gInBpbyI7Cj4gICAgICAgICAgICAg
ICAgIH07Cj4KPiBNYXliZSB0aGUgdmVuZG9yIGtlcm5lbCB1c2VzIHRoZSBhYm92ZSBpbmZvcm1h
dGlvbiB0byAiYm9vc3QiCj4gdGhlIHBlcmZvcm1hbmNlIG9mIHRoZSBTRElPLWJhc2VkIFdpRmkg
YWRhcHRlcj8KUElPIGlzIGFsc28gd2hhdCB3ZSBzdXBwb3J0IHVwc3RyZWFtIHdpdGggdGhlCmFt
bG9naWMsZHJhbS1hY2Nlc3MtcXVpcms7ICh3aGljaCBpcyBlbmFibGVkIGZvciAmc2RfZW1tY19h
KS4KVGhpcyBzdWdnZXN0cyB0aGF0IHRoZSBwaW5jdHJsIHRyaWNrIHRoYXQgTmVpbCBtZW50aW9u
ZWQgaXMgbm90IHVzZWQgaGVyZS4KCkkgYXNzdW1lIHRoYXQgdGhlIHdpZmkgZHJpdmVyIG9uIHRo
ZSB2ZW5kb3Iga2VybmVsIGlzIHRoZSBicmNtZGhkIChvdXQKb2YgdHJlZSkgZHJpdmVyLCB3aGls
ZSBtYWlubGluZSB1c2VzIGJyY21mbWFjLgpPbmUgaWRlYSB0aGF0IGNvbWVzIHRvIG15IG1pbmQg
aXMgdG8gZW5hYmxlIHRoZQphbWxvZ2ljLGRyYW0tYWNjZXNzLXF1aXJrOyAoYW5kIHVzZSBwaW8g
bW9kZSBvbiB0aGUgdmVuZG9yIGtlcm5lbCkgZm9yCmVNTUMgb3IgU0QgY2FyZCBhbmQgdGhlbiBj
b21wYXJlIHJlYWQvd3JpdGUgc3BlZWRzLiBJZiB0aGV5IGFyZQpzaW1pbGFyLWlzaCB0aGVuIHRo
ZSB3aWZpIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2UgaXMgbGlrZWx5IGNhdXNlZCBieQp0aGUgd2lm
aSBkcml2ZXIgKG9yIGluIHRoZSBvcHBvc2l0ZSBjYXNlOiBpZiByZWFkL3dyaXRlIHNwZWVkcyBv
bgptYWlubGluZSB3aXRoIGFtbG9naWMsZHJhbS1hY2Nlc3MtcXVpcms7IHBlcmZvcm0gd29yc2Ug
dGhhbiB0aGUgdmVuZG9yCmtlcm5lbCB3aXRoIHBpbyBtb2RlIHRoZW4gaXQncyBsaWtlbHkgdGhh
dCBpdCdzIGEgbWVzb24tZ3gtbW1jIGRyaXZlcgpsaW1pdGF0aW9uKS4KCkZyb20gbXkgd29yayBv
biB0aGUgcnR3ODggU0RJTyB3aWZpIGRyaXZlciBJIGNhbiBzYXkgdGhhdCB0aGUKbWVzb24tZ3gt
bW1jIGRyaXZlciBjYW4gcHVzaCAoVFggZGlyZWN0aW9uKSBhdCBsZWFzdCAxMjBNYml0L3MuCkkg
dW5kZXJzdGFuZCB0aGF0IHRoaXMgaXMgaGFsZiBvZiB3aGF0IHlvdSBnZXQgd2l0aCB0aGUgdmVu
ZG9yIGtlcm5lbAotIGFuZCB0aGF0IHRoaXMgaXMgdGhlIHdyb25nIGRpcmVjdGlvbiAoeW91J3Jl
IHRlc3RpbmcgUlggd2hpbGUgSSdtCnRlc3RpbmcgVFgpLgpUaGUgcG9pbnQgdGhhdCBJIHdhbnQg
dG8gZ2V0IGFjcm9zcyBpczogSSB0aGluayBub2JvZHkgaGFzIHRoZSBvbmUKYW5zd2VyIHdoeSB3
aWZpIHBlcmZvcm1hbmNlIGlzIGxvd2VyIChwZXJzb25hbGx5IEknbSBoYXBweSB3aXRoIGhhdmlu
ZwppdCB3b3JrIGF0IGFsbCwgcGVyZm9ybWFuY2UgaXMgc2Vjb25kKS4KU28gaXQnbGwgYmUgYSBw
cm9jZXNzIHRvIGZpbmQgdGhlIHJlYXNvbiwgYW5kIEkgdGhpbmsgaXQgcmVxdWlyZXMKYmVpbmcg
Y3JlYXRpdmUgZHVlIHRvIHRoZSBsYXJnZSBhbW91bnRzIG9mIGRpZmZlcmVudCBjb2RlIChNTUMg
ZHJpdmVyLAp3aWZpIGRyaXZlciwgYWRkaXRpb25hbCBwYXRjaGVzLi4uKSBiZXR3ZWVuIG1haW5s
aW5lIGFuZCB0aGUgdmVuZG9yCmtlcm5lbC4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKClswXSBo
dHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9TRF9jYXJkI1Bvd2VyX2NvbnN1bXB0aW9uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
