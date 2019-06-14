Return-Path: <SRS0=Cb+X=UN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331CBC31E4E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 22:22:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6F12184D
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 22:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usuIaZxV";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="Ihss/YaY";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="Ihss/YaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA6F12184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aplu.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PvpK5igvVxD6wowdSQREsk9XweAZMPsMm7T4uvwf8o0=; b=usuIaZxVSdc0nn
	Ltl0PG9VkkmDtaExZcEeYOIJoKdjDlTLbHsmo/DxkGd3edVRBsMf1IhmikH2gQWNuEmkP+OoNpZQi
	KjqZvBQpaON2gX0reMZli3UVcpfYKn3YTu+/s7RB80+s8IbWLI9ETk6d55DOvm7VcK+Hobs5ablCj
	nQKRr87LRkvXH5hnSqU9r2YlL5WAuuDzzRKSkSAH+SXt/j+ZlHcvbuzPvrV2VAq2J5nxFo+/aTJXc
	EAy4bw+ne2SoDmNyGLzkVCUvbJA4yCoVeXeCNhLtdS0QfesYV84Pyk2N5x7DlHXjcm2QEpRJZNTRI
	7Za+EcAG71m/5x3xZLHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbuao-0000Hk-8w; Fri, 14 Jun 2019 22:22:42 +0000
Received: from eva.aplu.fr ([91.224.149.41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbual-0000HF-6b
 for linux-amlogic@lists.infradead.org; Fri, 14 Jun 2019 22:22:40 +0000
Received: from eva.aplu.fr (localhost [127.0.0.1])
 by eva.aplu.fr (Postfix) with ESMTP id B4F41E32
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jun 2019 00:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560550956; bh=JKLYNMeBlMnOq/PPD4dSLSk7aQnUyduNF2Wc8NnfyCI=;
 h=From:Subject:To:Date:From;
 b=Ihss/YaYnTnwtscMIKwGDjgccjOSLLxtrVEgMIpBrRNj1pWmIeOd3GWIRPyL3GrR/
 gHs/gkw5JSUtjVnbQUDq8loTpyrw1gyNulTOJyCTcF6rpkgVkdOySK+Ieyjww2utcz
 +nHPZwJvYLW4qZW3gT61lY1fTCzwwUyrUGq74odbYGn9dr8CeGm9TsPsE7FhWevY/5
 qos2zZq7HOjoO6qE6GJLKaKagaUagz0dfOoWxe1XADyvAb51oyHeqXwO+yEhMUaRqN
 /JHUzdSVOi7celeD/nhrQQrbIevpUjYkMj7DBcnkYdbBBIT7/H+lVH52OaepRfzIU+
 PoooJH5jhh8wkEXm9/hmwADmvao6hQi+tgqGRkbmjR8x2SFUZy9QY7PmBoML+VmvWC
 Do28ylvxvmsLWAqwzc7/ojTPOfQdFN04YsN+aPZKHMPHH4Twr0qWw84m5E/t+jTIWE
 NoeWRdTPRTaI40f17HI7hww9/GJTydLVLKVEI/x7tQrS4xbtfVL7E1qWndGujW8YhN
 05nUgfwTC2ooYqsfh7voB+KCCrMvlh9X8dKLTvQd67UqIVJ1qvHacVI0t9J/rrpdlb
 QD2JlU0+ZCi01q9CjFHgnvdjHhPNLEFaW7EDrFo/OpguW7rxUW4LNH6jFJeOvcEca2
 UhAVhX3mrd3G7RAIyT7iJv44=
Received: from [IPv6:2a03:7220:8081:2901::1003] (unknown
 [IPv6:2a03:7220:8081:2901::1003])
 by eva.aplu.fr (Postfix) with ESMTPSA id 70E80CE8
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jun 2019 00:22:36 +0200 (CEST)
Authentication-Results: eva.aplu.fr;
 dmarc=fail (p=none dis=none) header.from=aplu.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560550956; bh=JKLYNMeBlMnOq/PPD4dSLSk7aQnUyduNF2Wc8NnfyCI=;
 h=From:Subject:To:Date:From;
 b=Ihss/YaYnTnwtscMIKwGDjgccjOSLLxtrVEgMIpBrRNj1pWmIeOd3GWIRPyL3GrR/
 gHs/gkw5JSUtjVnbQUDq8loTpyrw1gyNulTOJyCTcF6rpkgVkdOySK+Ieyjww2utcz
 +nHPZwJvYLW4qZW3gT61lY1fTCzwwUyrUGq74odbYGn9dr8CeGm9TsPsE7FhWevY/5
 qos2zZq7HOjoO6qE6GJLKaKagaUagz0dfOoWxe1XADyvAb51oyHeqXwO+yEhMUaRqN
 /JHUzdSVOi7celeD/nhrQQrbIevpUjYkMj7DBcnkYdbBBIT7/H+lVH52OaepRfzIU+
 PoooJH5jhh8wkEXm9/hmwADmvao6hQi+tgqGRkbmjR8x2SFUZy9QY7PmBoML+VmvWC
 Do28ylvxvmsLWAqwzc7/ojTPOfQdFN04YsN+aPZKHMPHH4Twr0qWw84m5E/t+jTIWE
 NoeWRdTPRTaI40f17HI7hww9/GJTydLVLKVEI/x7tQrS4xbtfVL7E1qWndGujW8YhN
 05nUgfwTC2ooYqsfh7voB+KCCrMvlh9X8dKLTvQd67UqIVJ1qvHacVI0t9J/rrpdlb
 QD2JlU0+ZCi01q9CjFHgnvdjHhPNLEFaW7EDrFo/OpguW7rxUW4LNH6jFJeOvcEca2
 UhAVhX3mrd3G7RAIyT7iJv44=
From: Aymeric <mulx@aplu.fr>
Subject: Meson8b network not stable at gigabit
To: linux-amlogic@lists.infradead.org
Openpgp: preference=signencrypt
Autocrypt: addr=mulx@aplu.fr; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2878d188-4c06-b1a3-4ba9-00a274cd2018@aplu.fr>
Date: Sat, 15 Jun 2019 00:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: fr
X-AV-Checked: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_152239_543923_EF5B7E12 
X-CRM114-Status: UNSURE (   5.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

SGVsbG8gYWxsLAoKSSd2ZSBqdXN0IHN1YnNjcmliZSBvbiB0aGlzIG1haWxpbmcgbGlzdCwgc28g
Zm9yZ2l2ZSBtZSBpZiBJJ20gbm90CmZvbGxvd2luZyBzb21lIHJ1bGVzLgoKQW55d2F5LCBJJ3Zl
IGFuIE9EUk9JRC1DMSBib2FyZCAod2hpY2ggbWVhbiBtZXNvbjhiL1M4MDUpIGFuZCBJJ3ZlIHNv
bWUKbmV0d29yayBzdGFiaWxpdHkgaXNzdWUgd2l0aCBib3RoIGtlcm5lbCA1LjAueCBhbmQgNS4x
LnggKGFzIG9mIHRvZGF5CkknbSB1c2luZyA1LjEuOSwgY29tcGlsZWQgbXlzZWxmIC0gY29uZmln
IGZpbGUgdXNlZCBpcyBhdmFpbGFibGUgaGVyZSBbwrldKS4KClRoZSBuZXR3b3JrIGNhcmQgaXMg
ZGV0ZWN0aW5nIHRoZSBsaW5rIGFzIGRvd24gYW5kIHVwIGV2ZXJ5IGZldyBzZWNvbmRzCm1ha2lu
ZyBpdCB1bnVzYWJsZS4KClRoZSBrZXJuZWwgZnJvbSBIYXJka2VybmVsICgzLjEwLnNvbWV0aGlu
ZykgaXMgd29ya2luZyBmaW5lLgoKU2VlIGEgc2FtcGxlIG9mIHRoZSBsb2cgKGRtZXNnKSBoZXJl
IFvCsl0uCgpUaGUgb25seSB3YXkgSSBmb3VuZCB0byBoYXZlIHRoZSBuZXR3b3JrIHN0YWJsZSBp
cyB0byB1c2UgZXRodG9vbCB0bwpmb3JjZSB0aGUgbGluayBhdCAxMDBNLgoKQXJlIHlvdSBhd2Fy
ZSBvZiBpdD8gSXMgdGhlcmUgYW55dGhpbmcgSSBjYW4gZG8/CgpBbHNvLCBJIGRpZG4ndCB0cnkg
d2l0aCBrZXJuZWwgNS4yLXJjNCB5ZXQsIG1heWJlIEkndmUgbWFkZSBhIG1pc3Rha2UgaW4KbXkg
LmNvbmZpZz8KClRoYW5rcyBpbiBhZHZhbmNlIQoKQXltZXJpYy4KClvCuV06IGh0dHBzOi8vZ2l0
bGFiLmNvbS9tdWx4L2tlcm5lbC1vZHJvaWRjMS9ibG9iL21hc3Rlci9jb25maWcKW8KyXToKaHR0
cHM6Ly9wYXN0ZS5hcGx1LmZyLz9iNWViNmRmNDhhOWM5NWI2I3NxSGs4eGhXR3dSZmFnV05wTCt1
N21Jc1BHV1ZXRm4yZDd4QnFpa2E4S2M9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
