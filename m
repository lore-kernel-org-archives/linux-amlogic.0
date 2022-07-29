Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9F5C00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 09:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUKOxYMbrBZdrIU0kfkntpom1ESSV8XMKYECLl0DUjg=; b=EEeFqAjP8Lmawh
	rYAif30PlYb/z16jvwmxkBUj125NloNUZoOOdwtIh4S0EM2UWCAi5+rczkgft27Jj1vYbEilMtvpn
	ge1hek+MB5FOQRR4w3Tn20lbZ/OQtT8CW1y21IgeqeePeDghRlJk9H8ArpM5tT1tG7jk9pbZA+xTP
	vQD/yMl92N1VDL1J5feA0UjTH2bgowyHJ1NVIyiuuNW5ZGg9UhtzTiswRFe0aKMg8dLnuREnJltjE
	rzYxjyKgW6XbUw3cTW5tM7bXh4rvwZS75LrUAFUnZW9xIHkkOyyVwOjGUW2mwnoZoFRYscRqmGB6O
	S5oVRH6sNwfr7KzQ5FOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM1H-003fpz-CR; Fri, 29 Jul 2022 09:10:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLxV-003df0-1Q
	for linux-amlogic@lists.infradead.org; Fri, 29 Jul 2022 09:07:02 +0000
Received: by mail-wr1-x42a.google.com with SMTP id b26so5245200wrc.2
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Jul 2022 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=Xuz7b31SZ6YAYumJHBVurHpw2rO7+Ja8ryp7tp5VZOk=;
        b=lZP98vktrRv81gPPiiUXrQADzP6Mv/O9M9hy591hYZZB1qAsEvIwzd0DCm1SJxdnH0
         zQtatHUP1QNgLMYa+Q1LLy0Y7Iud6BuDiET5qbzKEuI4tTo4UR/PaHJkrkyRsjNWoiw9
         n17NEOpQruPlM9h6I3djY/31KmUQQgGycAcTX8jjI1mwCa5WurXrwIBhQ25bMxprZl6d
         +DgPrcsqFyKNrlwWtzoLiYOUTRi8ktRdkXKmhdgANOGCbDx53qfm8CH9276kcc/przRy
         WmW3c+/871xf2VXXB4NlprC9zMNsBYo4KwE84E2X3KO/du83SsIXcX3DAiQ+sdc2slvD
         X2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=Xuz7b31SZ6YAYumJHBVurHpw2rO7+Ja8ryp7tp5VZOk=;
        b=rFEM2KvNXb/9HEUJH4KSwWDqPMtppFrtNpnXdUWiReTdIuXXthKPwoWryM4KW0NZre
         lr9PX8Ou/NnpUw+HNERK1jTDeLlhahX1B+zJ6LN5hWaiz8eHj9viJOXf+j/L++vIr7X6
         Ks1VExPVWmbKQHi/XJS1WwWdkMehwlhupf9clxtUC/PhTi4GNk8T4XjcdQKk28jBfMPV
         IGTjYcPRTbCXf/beuFDDXMa74SAYqSyMWdZadtOgPaI21zjXBgJdFCwkldkO5FDyEjoS
         Q2iNIJDxAxkzHXPjzqfyfduc4fPVFgMpGlXLmm02+tBlm32CDKXRR4kuEC89M2reFbXt
         zRRw==
X-Gm-Message-State: ACgBeo39MTqZo4KCExzgJegAmRIHMDUMZFNKfffzDe+UMLg7hn+6J40L
	vBsrouauusRkqBHJlGIvH0Q=
X-Google-Smtp-Source: AA6agR44DjBZWJyjyaXogrlqG2/oyAQ95weNGFS2YkkqRteBULPfHkamSDbm9eqLBahUPT61SgGD8A==
X-Received: by 2002:adf:d1e2:0:b0:21d:c7ae:3b1a with SMTP id g2-20020adfd1e2000000b0021dc7ae3b1amr1725590wrd.700.1659085616268;
        Fri, 29 Jul 2022 02:06:56 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id q2-20020a5d6582000000b0021e52020198sm3049879wru.61.2022.07.29.02.06.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jul 2022 02:06:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <YuOdWyF2yJVhh415@gofer.mess.org>
Date: Fri, 29 Jul 2022 13:06:51 +0400
Cc: Zhang Ning <zhangn1985@qq.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <D258CD0B-4490-4182-85A5-BE8D213EB70F@gmail.com>
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
 <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
 <YuOdWyF2yJVhh415@gofer.mess.org>
To: Sean Young <sean@mess.org>
X-Mailer: Apple Mail (2.3696.100.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_020701_111337_FF30797B 
X-CRM114-Status: GOOD (  13.52  )
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

Cj4gT24gMjkgSnVsIDIwMjIsIGF0IDEyOjQyIHBtLCBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mub3Jn
PiB3cm90ZToKPiAKPiBPbiBUaHUsIEp1bCAyOCwgMjAyMiBhdCAwNzo0ODo1N0FNICswODAwLCBa
aGFuZyBOaW5nIHdyb3RlOgo+PiBDaHJpc3RpYW4gSGV3aXR0IHRvbGQgbWUgdG8gc3BsaXQgdG8g
MiBwYXRjaGVzLCAxc3QgZm9yIG1hbnVmYWN0b3IsIDJuZAo+PiBmb3IgZGV2aWNlLCBob3cgdG8g
aGFuZGxlIHlvdXIgQWNrZWQtYnk/Cj4+IAo+PiBidHcsIGhlIGFsc28gc2FpZCBJJ20gd3Jvbmcg
aW4gaGFuZGxlIFNlYW4ncyBTaWduZWQtb2YtYnksIHN0aWxsIGRvbid0Cj4+IGtub3cgaG93IHRv
IGRvIGluIG5leHQgdmVyc2lvbi4gU2hvdWxkIEkganVzdCBub3Qgc2VuZCB0aGlzIHBhdGNoPwo+
IAo+IENocmlzdGlhbiBjYW4geW91IGV4cGxhaW4gKm9uIGxpc3QqIHdoYXQgaXMgd3Jvbmcgd2l0
aCBoYW5kbGluZyBteQo+IFNpZ25lZC1vZmYtYnk/IEFzIGZhciBhcyBJIGNhbiBzZWUgTmluZyBo
YXMgZG9uZSB0aGUgcmlnaHQgdGhpbmcuCgpTb3JyeSwgdGhpcyBpcyBteSBpZ25vcmFuY2UuIEni
gJl2ZSBvbmx5IHNlZW4gbWFpbnRhaW5lcnMgcHJvdmlkZSBBY2tlZC1CeQpvciBSZXZpZXdlZC1C
eSB0YWdzIGluIHJlc3BvbnNlIHRvIG15IG93biBwYXN0IHN1Ym1pc3Npb25zLiBJ4oCZdmUgbm90
IGhhZApTaWduZWQtT2ZmLUJ5IHJlc3BvbnNlcyBvbi1saXN0IGJlZm9yZS4gSeKAmXZlIG9ubHkg
c2VlbiBtYWludGFpbmVyIFNPQgpiZWluZyBhcHBsaWVkIHRvIHBhdGNoZXMgYXMgdGhleSBhcmUg
bWVyZ2VkIGludG8gdGhlIG1haW50YWluZXJzIHRyZWUKYW5kIHF1ZXVlZCBmb3Igc2VuZGluZyB1
cHN0cmVhbS4gVG9kYXkgaXMgYSBsZWFybmluZyBkYXkgOikKCj4gUGxlYXNlIGtlZXAgdGhlIGNv
bnZlcnNhdGlvbiBvbiBsaXN0IHNvIHdlJ3JlIGFsbCBpbiB0aGUgbG9vcC4KClRoZSBib2FyZCBz
dGlsbCBoYXMgc29tZSBoYXJkd2FyZSBpdGVtcyB0byBmaWd1cmUgb3V0IGFuZCB0aGUgbmV4dCBk
YXRlCkFtbG9naWMgcGF0Y2hlcyB3aWxsIGJlIHBpY2tlZCBmb3IgNS4yMSBpcyB+Mi41IG1vbnRo
cyBhd2F5LCBzbyB0aGVyZQppcyBubyBydXNoIGFuZCBJ4oCZdmUgZW5jb3VyYWdlZCBaaGFuZyB0
byBrZWVwIHdvcmtpbmcgdmlhIHRoZSBBcm1iaWFuCmZvcnVtIHRocmVhZCB0aGF0IGhlIHN0YXJ0
ZWQgWzBdLiBJ4oCZbSBubyBleHBlcnQgKGFzIHlvdSBjYW4gc2VlIF4pIGJ1dApJ4oCZbSB0cnlp
bmcgdG8gY29hY2ggYW5kIGV4cGxhaW4vc3BvdCB0aGUgY29tbW9uIGV0aXF1ZXR0ZSBhbmQgcHJv
Y2VzcwpuaXRzICh3aGljaCBJ4oCZdmUgbWFkZSBteXNlbGYgaW4gdGhlIHBhc3QpIGJlZm9yZSBo
ZSBzZW5kcyB0aGUgbmV4dCByZXYuCm9mIHBhdGNoZXMgZm9yIHJldmlldy4KCkNocmlzdGlhbgoK
WzBdIGh0dHBzOi8vZm9ydW0uYXJtYmlhbi5jb20vdG9waWMvMjIzMDEtaGVscC10by1yZXZpZXct
cG9ydGluZy1tYWlubGluZS11LWJvb3QtYW5kLWxpbnV4LXRvLXRtYWxsLW1hZ2ljYm94LW0xNnMt
YW1sb2dpYy1zOTEyLWgtdHYtYm94LwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
