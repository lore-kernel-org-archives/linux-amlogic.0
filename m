Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A7BC77B7A
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 May 2023 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+vTHMEZ5srb/Cxu2BEyY0IMsOky0+sAOs2T3UMyydk=; b=QhEjxcc/xm+9GF
	SOjR7e+GxXyYBe60b7ifNVs7fRW3ajZatApufonWDJYYjvnenxZmixHPt+dHh2vzk3rDxNJvcQ4E0
	K/EJPDgSHV1rgrq7xpXHXHuFMitAOHZk8IECBWE68vpbp+g+A7VPEpZkki2cI3TxFzuAI20N5xquv
	pt/9iUTU4j8bu50TMX0IxfjVO1pcAzkd72/05MSPvrw+xUdeDBnEqnQz9zQYZfQBXJh0MNv2kqdX/
	NSbJxZLUH4QDTh7ljm8kPs71R8rRmAz+N7Y1fOzEvEIpyLHzd4z9BsBampKFBUTpXU7MUv9fHl9k0
	t7LXv/lY+0Ex+YVvS2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q07Gm-00HE5i-03;
	Fri, 19 May 2023 21:04:12 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q07Gj-00HE4i-0z;
	Fri, 19 May 2023 21:04:10 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-966400ee79aso706307866b.0;
        Fri, 19 May 2023 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684530245; x=1687122245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkFYXyw6E6pRYTnNx+J/HE05WAp42aJlf5/0x0V1JCs=;
        b=rkRtv4x5WBfjnsuw2tXqLklYYFCadX+a4fTsoPj5ATokjuxnDYf4rwcGcDTp8hO1iG
         jfUNr8Xrfn7KNAf5WXvhdjHDQUF+tsTzHerKfs3pQbaCMyZ+djRZhan6J0JTbfl5sr51
         zMa1wCqHO9jjvkx0BGEVagVyL8xLifC9PEL8M3q2R2uUNPXshj0PgRdkQdtQvS6dulpW
         TftRKlnCNANMIegInpEDA3mb+axeIfmq/7FRfVKZkf18Fl5mZ2MVFfQDZyYeF3BzwSkY
         FkVP9EoYaktsb/0z3jufmXu+IuOu8+FlF51lhIWMC5UJnxgnoClWFwiBLm2PHiVAQjxA
         terQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684530245; x=1687122245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkFYXyw6E6pRYTnNx+J/HE05WAp42aJlf5/0x0V1JCs=;
        b=dmuovmerNTWKUy1HOwg2NZJO/gEhMgDVTHKwuKGHUKn6Gx1KZPo71NCTqayaYduEvm
         WRk0Il2VVZL9T06OrIL8yWh/V0ZeyTwbAqleNZYq6gph4Gt6shYKxuhQdhNkyhxlt1Dx
         JPPzxjgKcH7FriyhoumGj6ULwWEfa3mxg3WpBwcOcZFk1JdzdRJyHrrtJL40iV3ZFESK
         Kr8ae3Ljk27Wumd6oJg1TWtqx69GT90Og5BVKvcP63k2mn7vUEdE44sxKpUX4OuxAqQU
         lcvMRjCwkgFjowbgzVvfMfeV5y0x6XZqT5iu1bOCrz45nANRnw1Wa0G8A1lD8TTYfQHq
         EYOg==
X-Gm-Message-State: AC+VfDyYgADEyC7KO5P7u52SyzGiAyVgm+QpngKPT3Zm1xviYaJk0Rue
	QmGfsd12lX1s9gbuUX0JEp0z3dSJSrPuRMJOX2E=
X-Google-Smtp-Source: ACHHUZ4c1gf0Sah0Blf/COARZBm2a1CGAAUrMBuEcAMrXckhdoCEp5PwqVEXLbfiq/huUY/m0gEr44qJf4A+Df/VnbY=
X-Received: by 2002:a17:907:1c8b:b0:94e:48ac:9a51 with SMTP id
 nb11-20020a1709071c8b00b0094e48ac9a51mr3825374ejc.4.1684530245293; Fri, 19
 May 2023 14:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru> <20230517133309.9874-7-ddrokosov@sberdevices.ru>
In-Reply-To: <20230517133309.9874-7-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 19 May 2023 23:03:54 +0200
Message-ID: <CAFBinCBs7-9CvfQLxLoG5=FjmSK+S5eGsLXOAyQN9kNOg2q-2g@mail.gmail.com>
Subject: Re: [PATCH v15 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_140409_586470_839C577D 
X-CRM114-Status: GOOD (  19.70  )
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

SGkgRG1pdHJ5LAoKT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMzozM+KAr1BNIERtaXRyeSBSb2tv
c292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ICtzdGF0aWMgc3Ry
dWN0IGNsa19yZWdtYXAgc3lzX2Jfc2VsID0gewo+ICsgICAgICAgLmRhdGEgPSAmKHN0cnVjdCBj
bGtfcmVnbWFwX211eF9kYXRhKXsKPiArICAgICAgICAgICAgICAgLm9mZnNldCA9IFNZU19DTEtf
Q1RSTDAsCj4gKyAgICAgICAgICAgICAgIC5tYXNrID0gMHg3LAo+ICsgICAgICAgICAgICAgICAu
c2hpZnQgPSAyNiwKPiArICAgICAgICAgICAgICAgLnRhYmxlID0gbXV4X3RhYmxlX3N5cywKPiAr
ICAgICAgIH0sCj4gKyAgICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2RhdGEpewo+
ICsgICAgICAgICAgICAgICAubmFtZSA9ICJzeXNfYl9zZWwiLAo+ICsgICAgICAgICAgICAgICAu
b3BzID0gJmNsa19yZWdtYXBfbXV4X3JvX29wcywKdGhlIHN5c18qX3NlbCBtdXhlcyBhbmQgc3lz
XypfZ2F0ZSBhcmUgX3JvLi4uCgo+ICsgICAgICAgICAgICAgICAucGFyZW50X2RhdGEgPSBzeXNf
cGFyZW50cywKPiArICAgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gQVJSQVlfU0laRShzeXNf
cGFyZW50cyksCj4gKyAgICAgICB9LAo+ICt9Owo+ICsKPiArc3RhdGljIHN0cnVjdCBjbGtfcmVn
bWFwIHN5c19iX2RpdiA9IHsKPiArICAgICAgIC5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9k
aXZfZGF0YSl7Cj4gKyAgICAgICAgICAgICAgIC5vZmZzZXQgPSBTWVNfQ0xLX0NUUkwwLAo+ICsg
ICAgICAgICAgICAgICAuc2hpZnQgPSAxNiwKPiArICAgICAgICAgICAgICAgLndpZHRoID0gMTAs
Cj4gKyAgICAgICB9LAo+ICsgICAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRh
KXsKPiArICAgICAgICAgICAgICAgLm5hbWUgPSAic3lzX2JfZGl2IiwKPiArICAgICAgICAgICAg
ICAgLm9wcyA9ICZjbGtfcmVnbWFwX2RpdmlkZXJfb3BzLAouLi5idXQgdGhlIHN5c18qX2RpdiBh
cmVuJ3QKSXMgdGhpcyBvbiBwdXJwb3NlPyBJZiBpdCBpczogd2h5IGNhbiB0aGUgZGl2aWRlciBi
ZSBjaGFuZ2VkIGF0CnJ1bnRpbWUgYnV0IHRoZSBtdXggY2FuJ3Q/CgpbLi4uXQo+ICsvKgo+ICsg
KiB0aGUgaW5kZXggMiBpcyBzeXNfcGxsX2RpdjE2LCBpdCB3aWxsIGJlIGltcGxlbWVudGVkIGlu
IHRoZSBDUFUgY2xvY2sgZHJpdmVyLApXZSBuZWVkIHRvIGFkZCB0aGUgInN5c19wbGxfZGl2MTYi
IGlucHV0IHRvIHRoZSBkdC1iaW5kaW5ncyBzaW5jZSB0aGV5CnNob3VsZCBhbHdheXMgZGVzY3Jp
YmUgdGhlIGhhcmR3YXJlIChyZWdhcmRsZXNzIG9mIHdoYXQgdGhlIGRyaXZlcgppbXBsZW1lbnRz
IGN1cnJlbnRseSkuCkknbSBub3Qgc3VyZSBob3cgdG8gbWFuYWdlIHRoaXMgd2hpbGUgd2UgZG9u
J3QgaGF2ZSB0aGUgQ1BVIGNsb2NrCmRyaXZlciByZWFkeSB5ZXQgYnV0IEknbSBzdXJlIFJvYiBv
ciBLcnp5c3p0b2Ygd2lsbCBiZSBhYmxlIHRvIGhlbHAgdXMKaGVyZS4KCj4gKyAqIHRoZSBpbmRl
eCA0IGlzIHRoZSBjbG9jayBtZWFzdXJlbWVudCBzb3VyY2UsIGl0J3Mgbm90IHN1cHBvcnRlZCB5
ZXQKSSBzdXNwZWN0IHRoYXQgdGhpcyBjb21lcyBmcm9tIHRoZSBjbG9jayBtZWFzdXJlciBJUCBi
bG9jayBhbmQgaWYgc28KdGhlIGR0LWJpbmRpbmdzIHNob3VsZCBwcm9iYWJseSBkZXNjcmliZSB0
aGlzIGlucHV0LiBCdXQgYWdhaW4sIHdlJ2QKbmVlZCB0byBrZWVwIGl0IG9wdGlvbmFsIGZvciBu
b3cgc2luY2Ugb3VyIGNsb2NrIG1lYXN1cmVyIGRyaXZlcgpkb2Vzbid0IGV2ZW4gaW1wbGVtZW50
IGEgY2xvY2sgY29udHJvbGxlci4KClsuLi5dCj4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBw
d21fYV9zZWwgPSB7Cj4gKyAgICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfbXV4X2Rh
dGEpewo+ICsgICAgICAgICAgICAgICAub2Zmc2V0ID0gUFdNX0NMS19BQl9DVFJMLAo+ICsgICAg
ICAgICAgICAgICAubWFzayA9IDB4MSwKPiArICAgICAgICAgICAgICAgLnNoaWZ0ID0gOSwKPiAr
ICAgICAgIH0sCj4gKyAgICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2RhdGEpewo+
ICsgICAgICAgICAgICAgICAubmFtZSA9ICJwd21fYV9zZWwiLAo+ICsgICAgICAgICAgICAgICAu
b3BzID0gJmNsa19yZWdtYXBfbXV4X29wcywKPiArICAgICAgICAgICAgICAgLnBhcmVudF9kYXRh
ID0gcHdtX2FiY2RfcGFyZW50cywKPiArICAgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gQVJS
QVlfU0laRShwd21fYWJjZF9wYXJlbnRzKSwKPiArICAgICAgICAgICAgICAgLyogRm9yIG1vcmUg
aW5mb3JtYXRpb24sIHBsZWFzZSByZWZlciB0byBydGMgY2xvY2sgKi8KPiArICAgICAgICAgICAg
ICAgLmZsYWdzID0gQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5ULApBcyBtZW50aW9uZWQgaW4gWzBd
IHdlJ2xsIHdvcmsgd2l0aCBIZWluZXIgdG8gc2VlIGlmIHdlIGNhbiBpbXByb3ZlCnRoZSBkZWNp
c2lvbiBtYWtpbmcgcHJvY2VzcyBvZiB0aGUgUFdNIGNvbnRyb2xsZXIgZHJpdmVyIHNvIHRoYXQg
d2UKY2FuIGp1c3QgaGF2ZSAuZmxhZ3MgPSAwIGhlcmUuClRoaXMgYXBwbGllcyB0byBhbGwgb3Ro
ZXIgb2NjdXJyZW5jZXMgb2YgdGhlIHNhbWUgY29tbWVudCBhYm91dCB0aGUgcnRjIGNsb2NrLgoK
CkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
