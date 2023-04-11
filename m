Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8DDC76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 19:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsh1PLSxOuUroZyFNhg9Mdwf3MKJYiJVq8XYK3ar99U=; b=WADv1o3Bq+qfvO
	qsd3GN6ENNE5q2vE/g+MeC1v1tMjMRTpDBOuf/7fnS9xzppbGdgxt/becpkAXw8qXucyjtG86kShS
	xMvNT1sLdGhHchkT3fjYu3mpexbRnLSevbzb8v1RW/rm2rHx9Xet8iRX4WRNFSgOb0P4G5OfDTXa8
	e+XdHd9WhAJC/oGyX3B9FTSIHTFIDlOFuGhkKzdLgJaQ2sQYN7JYrQ29XgXWecAwNBttwO5wS6r0u
	/KdoQBGti7SxZtuKb3yAJGMnbD95cnmzn/+64s6zAGUfy12xJOuq0Y1PYMku4gn0dezGilj4N+OFn
	JkuwkWESIU4SjSrEMP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJhM-000xMU-2h;
	Tue, 11 Apr 2023 19:30:36 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJhJ-000xLa-2U;
	Tue, 11 Apr 2023 19:30:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ga37so23489214ejc.0;
        Tue, 11 Apr 2023 12:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681241430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/djvqI9JsJGvDn3SeW6vm5P6m42AvZNBj0jcHhZnRM4=;
        b=AqRqt8mlFu1EZUsVr+zspOkJ4uOQ+yIr1IjZ1zhhq31AVvWsJDwCtAt3Zht1izog4M
         JkAS3c3Dz882M05M0FLebvBd8mkPB2iX7vvxpWFUGyO03ytitNYxL8S1iEQoY2bj0ZDa
         +T4YaBqXthOb6pr4NxBHo+qgGvGOWorR03SZYGEyN1T/qoHK/W5BJ4hY0OTAuGJ/HmSN
         HqFG1yhc3jSWKxjZoVRVdB32QjkSHh7FhEbk042cb+w3iJEkjA938iglZ9DU3e0jrlRd
         YPvE8VzoQZ0c0wj+7houxZYFRbJfVP/4b3uZ+8JbwAk6hWkGdhSrglTw1ggb6WmcG8LY
         iqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681241430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/djvqI9JsJGvDn3SeW6vm5P6m42AvZNBj0jcHhZnRM4=;
        b=HjFWzNnRXwaxPppbRqayiTRk2O6iB982N4gfAkJHzoYVz8D0e2Gu+WIs3jsvXQMllS
         Wc6JZCfNfP9lHp1xprgbm2m68K1XDnxnlU4fSxIIOGq9P1uhySXRvqvqmfJ6oml86pqf
         YoJsgyuciveNUYSzVYMVooB5mzzhFOKB14129YSXfWKESfKH+weCqv3NAnrmQRM9zkZt
         MIxAXviUIrmKKDFLtZ03jzWYS6pov6zuOUman49K1MjT1VgBtpbBWsBQc8LZtf6I8LLT
         8R0A6F/cvEq9oAIhMqDsQiriJDcOIrQQfy3wN1Caj1de1SQSwbznZ/xIf593sbr5QgOP
         Tn8Q==
X-Gm-Message-State: AAQBX9fSeZ7gUt9IuT3MhtfoT0Nv3HY0oZjlhV1nq2fKnsIjfEQnja28
	JDOKUQ5bNao/9lOPjfl8kaRcSS9yBNkmXT3Qzek=
X-Google-Smtp-Source: AKy350Z8La4docT1vMFuoXxvI/XsDKC+Hy4e6yD7JK7aCMklvTxvE8XQXPb50PEcBK/AIQfgVHJcGowSXtJlkVPio84=
X-Received: by 2002:a17:907:ea5:b0:94a:972c:c28d with SMTP id
 ho37-20020a1709070ea500b0094a972cc28dmr3782765ejc.6.1681241429546; Tue, 11
 Apr 2023 12:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230410193048.31084-1-exkcmailist@inbox.lv> <20230410193048.31084-3-exkcmailist@inbox.lv>
In-Reply-To: <20230410193048.31084-3-exkcmailist@inbox.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Apr 2023 21:30:18 +0200
Message-ID: <CAFBinCCXYnChN8MfOxGEDSTm4HftpzuwwHwtqm7b1dPH6EdUsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: meson-gxl: add support for Xiaomi
 Mibox 3
To: Karl Chan <exkcmailist@inbox.lv>
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Karl Chan <exxxxkc@getgoogleoff.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_123033_832060_E399B096 
X-CRM114-Status: GOOD (  13.13  )
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

SGVsbG8gS2FybCwKCk9uIE1vbiwgQXByIDEwLCAyMDIzIGF0IDk6MzHigK9QTSBLYXJsIENoYW4g
PGV4a2NtYWlsaXN0QGluYm94Lmx2PiB3cm90ZToKPgo+IEZyb206ICJLYXJsIENoYW4iICA8ZXhr
Y21haWxpc3RAaW5ib3gubHY+Cj4KPiBUaGUgWGlhb21pIE1pYm94IDMgaXMgYSBUViBib3ggYmFz
ZWQgb24gdGhlIEFtbG9naWMgUzkwNVggY2hpcHNldC4KSSBmb3VuZCB2YXJpb3VzIHdlYnNpdGVz
IHJlZmVycmluZyB0byB0aGlzIGRldmljZSBhcyAiTWkgQm94IDMiIChzbwpzcGFjZSBiZXR3ZWVu
IE1pIGFuZCBCb3gpLgpEbyB5b3Uga25vdyB0aGUgb2ZmaWNpYWwgbmFtZSB0aGF0IFhpYW9taSB1
c2VkPwoKPiBUaGVyZSBhcmUgdHdvIHZhcmlhbnRzOgo+IC0gMiBHaUIvOEdJQgo+IC0gMSBHaUIv
NEdJQgo+Cj4gQm90aCB2YXJpYW50cyBjb21lIHdpdGg6Cj4gLSA4MDIuMTFhL2IvZy9uL2FjIHdp
ZmkgKEJDTTQzNDUpCj4gLSBIRE1JICwgQVYgKENWQlMpIGFuZCBTL1BESUYgb3B0aWNhbCBvdXRw
dXQKbml0LXBpY2s6IG5vIHNwYWNlIGJlZm9yZSB0aGUgY29tbWEKCj4gLSAxeCBVU0IgKHV0aWxp
emluZyBib3RoIFVTQiBwb3J0cyBwcm92aWRlZCBieSB0aGUgU29DKQpDYW4geW91IHBsZWFzZSBl
eHBsYWluIHRoaXMgaW4gYSBiaXQgbW9yZSBkZXRhaWw/Ck15IHVuZGVyc3RhbmRpbmcgaXMgdGhh
dCB0aGlzIGJvYXJkIGhhcyBvbmUgVVNCIDIuMCB0eXBlIEEgcG9ydC4gV2hhdApkbyB5b3UgbWVh
biBieSAidXRpbGl6aW5nIGJvdGggVVNCIHBvcnRzIj8KCkFsc28gSSdtIGN1cmlvdXM6IGRvZXMg
dGhlIGJvYXJkIGNvbWUgd2l0aCBlTU1DIG9yIChyYXcvcGFyYWxsZWwpIE5BTkQKZmxhc2g/IFAy
MTIgdHlwaWNhbGx5IG1lYW5zIGVNTUMuCgpbLi4uXQo+ICsvKiBUaGlzIFVBUlQgaXMgYnJvdWdo
dCBvdXQgdG8gdGhlIHVhcnQgcGFkIG9uIHRoZSBwY2IqLwpuaXQtcGljazogbWlzc2luZyBzcGFj
ZSBhZnRlciAicGNiIgpBcmUgdGhlIFVBUlQgcGFkcyBvYnZpb3VzIG9uIHRoZSBib2FyZCAoZm9y
IGV4YW1wbGUgc2luY2UgdGhleSBhcmUKbGFiZWxsZWQpPyBJZiBub3Q6IG1heWJlIGFkZCBhIGhp
bnQgd2hlcmUgdG8gZmluZCBpdAoKWy4uLl0KPiArJnVzYiB7Cj4gKyAgICAgICBzdGF0dXMgPSAi
b2theSI7Cj4gKyAgICAgICBkcl9tb2RlID0gImhvc3QiOwo+ICt9OwpUaGlzIGlzIGFscmVhZHkg
aW5oZXJpdGVkIGZyb20gbWVzb24tZ3hsLXM5MDV4LXAyMTIuZHRzaSBzbyByZW1vdmluZwppdCBz
aG91bGQgcmVzdWx0IGluIHRoZSBzYW1lIC5kdGIKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
